using InsiscoCore.Base.Service;
using iText.Forms.Xfdf;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using TemplateNetCore.Api.Configuration;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Enum;

namespace TemplateNetCore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServiceController : CustomController
    {
        IWriteService<SpeiResponse> _SpeiResponseWriteService;
        IConfiguration _Configuration;
        IRetrieveService<Company> _CompanyRetrieveService;
        IRetrieveService<Dispertion> _DispertionRetrieveService;
        IWriteService<LogError> _LogErrorWriteService;

        public ServiceController(
            IWriteService<SpeiResponse> speiResponseWriteService,
            IConfiguration configuration,
            IRetrieveService<Company> companyRetrieveService,
            IRetrieveService<Dispertion> dispertionRetrieveService,
            IWriteService<LogError> logErrorWriteService
            )
        {
            this._SpeiResponseWriteService = speiResponseWriteService;
            this._Configuration = configuration;
            this._CompanyRetrieveService = companyRetrieveService;
            this._DispertionRetrieveService = dispertionRetrieveService;
            this._LogErrorWriteService = logErrorWriteService;
        }

        [HttpPost, Route("stp/status")]
        public IActionResult GetStatusDispertion(StateChange stateChange)
        {
            var result = this._SpeiResponseWriteService.Update<StateChange, SpeiTransactionResult>(stateChange);
            
            if (result.Success)
            {
                var f = this._DispertionRetrieveService.Where(d => d.Enabled == true).ToList();
                var dispertions = this._DispertionRetrieveService.Where(d => d.Clave_Rastreo == stateChange.FolioOrigen).FirstOrDefault();
                string baseUri = this._CompanyRetrieveService.Where(c => c.id == dispertions.Company_Id).First().UrlResponse;

                stateChange.Empresa = "";

                var json = Newtonsoft.Json.JsonConvert.SerializeObject(stateChange);

                var request = (HttpWebRequest)WebRequest.Create($"{baseUri}");
                request.Method = "PUT";
                request.ContentType = "application/json";
                request.Accept = "application/json";

                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }

                try
                {
                    using (WebResponse response2 = request.GetResponse())
                    {
                        using (Stream strReader = response2.GetResponseStream())
                        {
                            if (strReader == null) return null;
                            using (StreamReader objReader = new StreamReader(strReader))
                            {
                                string responseBody = objReader.ReadToEnd();
                                return Ok(stateChange);
                            }
                        }
                    }
                } 
                catch (WebException exception)
                {
                    this._LogErrorWriteService.Create(new LogError()
                    {
                        created_at = DateTime.Now,
                        updated_at = DateTime.Now,
                        message_error = exception.Message,
                        Inner_Exception_Message = json,
                        code_line = (new System.Diagnostics.StackFrame(0, true)).GetFileLineNumber(),
                        method_name = MethodBase.GetCurrentMethod().Name,
                        class_name = "Service",
                        file_name = "ServiceController.cs"
                    });
                    return StatusCode(500, exception);
                }

            }
            return Ok(result.Success);
        }

    }
}