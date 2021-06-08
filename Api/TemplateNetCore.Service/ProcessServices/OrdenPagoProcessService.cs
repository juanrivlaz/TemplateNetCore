using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using Newtonsoft.Json;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Spei;
using TemplateNetCore.Service.Tools;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using iText.Kernel.Pdf;
using iText.Html2pdf;
using TemplateNetCore.Model.Configurations;

namespace TemplateNetCore.Service.ProcessServices
{
    public class OrdenPagoProcessService : ProcessService<ordenPagoWS>
    {
        IRetrieveService<Accredited> _AccreditedRetrieveService;
        IRetrieveService<Configuration> _ConfigurationRetrieveService;
        IRetrieveService<Company> _CompanyRetrieveService;
        IRetrieveService<CentroCostos> _CentroCostosRetrieveService;
        //IWriteService<Dispertion> _DispertionWriteService;
        //IWriteService<SpeiResponse> _SpeiWriteService;

        public OrdenPagoProcessService(
           IRetrieveService<Accredited> accreditedRetrieveService,
           IRetrieveService<Configuration> configurationRetrieveService,
           IRetrieveService<Company> companyRetrieveService,
           IRetrieveService<CentroCostos> centroCostosRetrieveService
            //IWriteService<Dispertion> dispertionWriteService,
            //IWriteService<SpeiResponse> speiWriteService
            )
        {

            this._AccreditedRetrieveService = accreditedRetrieveService;
            this._ConfigurationRetrieveService = configurationRetrieveService;
            this._CompanyRetrieveService = companyRetrieveService;
            this._CentroCostosRetrieveService = centroCostosRetrieveService;
            //this._DispertionWriteService = dispertionWriteService;
            //this._SpeiWriteService = speiWriteService;
        }

        public ResponseSpei ExecuteProcess(Accredited accredited)
        {
            try
            {
                var configurations = this._ConfigurationRetrieveService.Where(p => p.Enabled == true).ToList();
                var company = this._CompanyRetrieveService.Where(c => c.id == accredited.Company_Id).ToList();
                var centro_costos = this._CentroCostosRetrieveService.Where(c => c.id == company.First().FkCentroCostos).ToList();

                byte[] file = File.ReadAllBytes(Path.Combine(Directory.GetCurrentDirectory(), configurations.Find(p => p.Configuration_Name == "CERTIFIED_FTP").Configuration_Value));
                string prefix = accredited.Prefijo ?? "PR";
                CryptoHandler crypto = new CryptoHandler();
                crypto.ruta = configurations.Find(p => p.Configuration_Name == "CERTIFIED_FTP").Configuration_Value;
                crypto.password = configurations.Find(p => p.Configuration_Name == "CERTIFIED_PASSWORD").Configuration_Value;
                ordenPagoWS ordenPago = new ordenPagoWS();
                ordenPago.empresa = centro_costos.First().Centro_Costos;
                ordenPago.claveRastreo = $"{prefix}{company.First().id}{DateTime.Now:yyyyMMddss}";
                ordenPago.referenciaNumerica = Convert.ToInt32(DateTime.Now.ToString("yyMMdd"));
                ordenPago.cuentaBeneficiario = accredited.Clabe;
                ordenPago.tipoPago = Convert.ToInt32(configurations.Find(p => p.Configuration_Name == "PAYMENT_TYPE").Configuration_Value);
                ordenPago.nombreBeneficiario = $"{accredited.First_Name} {accredited.Last_Name}";
                ordenPago.rfcCurpBeneficiario = accredited.Rfc;
                ordenPago.topologia = configurations.Find(p => p.Configuration_Name == "TOPOLOGY").Configuration_Value;
                ordenPago.institucionOperante = Convert.ToInt32(configurations.Find(p => p.Configuration_Name == "OPERATING_INSTITUTION").Configuration_Value);
                ordenPago.tipoCuentaBeneficiario = Convert.ToInt32(configurations.Find(p => p.Configuration_Name == "TYPE_BENEFICIARY_ACCOUNT").Configuration_Value);
                ordenPago.conceptoPago = configurations.Find(p => p.Configuration_Name == "PAYMENT_CONCEPT").Configuration_Value;
                ordenPago.institucionContraparte = accredited.Institution_Id;
                ordenPago.monto = decimal.Add(Convert.ToDecimal(accredited.Amount), .00m);
                ordenPago.firma = crypto.sign(ordenPago, file);
                var resultado = CallService(ordenPago, configurations);
                if (resultado.resultado.id > 0) resultado.resultado.claveRastreo = ordenPago.claveRastreo;
                /*Dispertion dispertion = new Dispertion
                {
                    Company_Id = accredited.Company_Id,
                    Clabe = ordenPago.cuentaBeneficiario,
                    Amount = accredited.Amount,
                    Institution_Id = ordenPago.institucionContraparte,
                    Clave_Rastreo = ordenPago.claveRastreo,
                    Estatus_Request = resultado.resultado.id,
                    Description_Request = resultado.resultado.descripcionError
                };
                bool crearDispertion = this._DispertionWriteService.Create(dispertion);*/
                //Dispertion datosDispertion = this._DispertionRetrieveService.Find(crearDispertion.id);
                /*this._SpeiWriteService.Create(new SpeiResponse()
                {
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now,
                    advance_id = crearDispertion.id,
                    tracking_id = resultado.resultado.id,
                    tracking_key = resultado.resultado.claveRastreo
                });*/
                return resultado;
            }
            catch (Exception exception)
            {
                return new ResponseSpei()
                {
                    resultado = new resultado()
                    {
                        id = -1,
                        descripcionError = exception.Message
                    }
                };
            }
        }

        ResponseSpei CallService(ordenPagoWS ordenPagoWS, List<Configuration> configurations)
        {
            string baseUri = configurations.Find(p => p.Configuration_Name == "API_SPEI").Configuration_Value;
            string method = configurations.Find(p => p.Configuration_Name == "API_ORDER_REGISTER").Configuration_Value;

            var jsonResolve = new PropertyRenameAndIgnoreSerializerContractResolver();
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "cuentaOrdenante");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "fechaOperacion");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "folioOrigen");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "tipoCuentaOrdenante");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "nombreOrdenante");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "rfcCurpOrdenante");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "emailBeneficiario");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "tipoCuentaBeneficiario2");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "nombreBeneficiario2");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "cuentaBeneficiario2");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "rfcCurpBeneficiario2");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "conceptoPago2");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "claveCatUsuario1");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "claveCatUsuario2");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "clavePago");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "referenciaCobranza");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "tipoOperacion");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "usuario");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "medioEntrega");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "prioridad");
            jsonResolve.IgnoreProperty(typeof(ordenPagoWS), "iva");

            var serializerSettings = new JsonSerializerSettings();
            serializerSettings.ContractResolver = jsonResolve;

            var json = JsonConvert.SerializeObject(ordenPagoWS, serializerSettings);

            var request = (HttpWebRequest)WebRequest.Create($"{baseUri}{method}");
            request.Method = "PUT";
            request.ContentType = "application/json";
            request.Accept = "application/json";

            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
            {
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();
            }

            using (WebResponse response2 = request.GetResponse())
            {
                using (Stream strReader = response2.GetResponseStream())
                {
                    if (strReader == null) return null;
                    using (StreamReader objReader = new StreamReader(strReader))
                    {
                        string responseBody = objReader.ReadToEnd();
                        return JsonConvert.DeserializeObject<ResponseSpei>(responseBody);
                    }
                }
            }
        }

        /*public bool ExecuteProcess(SendSpeiMail sendSpeiMail)
        {
            try
            {
                var contacts = this._ContactRetrieveService.Where(p => p.Enabled == true).ToList();
                var accredited = this._AccreditedRetrieveService.Find(sendSpeiMail.Accredited_Id);
                var configurations = this._ConfigurationRetrieveService.Where(p => p.Enabled == true).ToList();
                //var docHtml = this._DocumentUserProcessService.ExecuteProcess<DocumentAccredited, MemoryStream>(new DocumentAccredited()
                //{
                //    Accredited = sendSpeiMail.Accredited,
                //    Advance = sendSpeiMail.Advance
                //});

                var cartaMandato = this._AcreditedCartaMandato.Where(c => c.Accredited_Id == accredited.id).FirstOrDefault();

                if (cartaMandato is null)
                {
                    this._AcreditedCartaMandatoWrite.Create(new AcreditedCartaMandato { Accredited_Id = accredited.id, Path_Contract = "", created_at = DateTime.Now, updated_at = DateTime.Now });
                    cartaMandato = this._AcreditedCartaMandato.Where(c => c.Accredited_Id == accredited.id).FirstOrDefault();
                }

                var contractMutuo = this._AccreditedContractMutuo.Where(c => c.Accredited_Id == accredited.id).FirstOrDefault();

                if (contractMutuo is null)
                {
                    this._AccreditedContractMutuoWrite.Create(new AccreditedContractMutuo { Accredited_Id = accredited.id, Path_Contract = "", created_at = DateTime.Now, updated_at = DateTime.Now });
                    contractMutuo = this._AccreditedContractMutuo.Where(c => c.Accredited_Id == accredited.id).FirstOrDefault();
                }

                string html = this._DocumentUserProcessService.ExecuteProcess<CartaMandato, string>(new CartaMandato { accredited = accredited, advance = sendSpeiMail.Advance, acreditedCartaMandato = cartaMandato, contractMutuo = contractMutuo });

                var mailConf = configurations.FirstOrDefault(p => p.Configuration_Name == "EMAIL_CONFIG");
                var messageConfig = configurations.FirstOrDefault(p => p.Configuration_Name == "MAI_ADVANCE");

                var messageMail = JsonConvert.DeserializeObject<TemplateNetCore.Model.Dto.Input.MessageMail>(messageConfig.Configuration_Value);

                string textHtml = File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), messageMail.Message));
                textHtml = textHtml.Replace("{NAME}", accredited.First_Name);
                textHtml = textHtml.Replace("{AMOUNT}", sendSpeiMail.Amount.ToString("C2"));
                textHtml = textHtml.Replace("{WHATSAPP}", contacts.Find(p => p.id == 1).Contact_Data);
                textHtml = textHtml.Replace("{MAIL_SOPORTE}", contacts.Find(p => p.id == 2).Contact_Data);
                textHtml = textHtml.Replace("{PHONE}", contacts.Find(p => p.id == 3).Contact_Data);
                messageMail.Message = textHtml;

                var memoryStream = new MemoryStream();
                using (var pdfWriter = new PdfWriter(memoryStream))
                {
                    pdfWriter.SetCloseStream(false);
                    using (var document = HtmlConverter.ConvertToDocument(html, pdfWriter))
                    {
                    }

                }

                memoryStream.Position = 0;

                using (FileStream fs = new FileStream(Path.Combine(Directory.GetCurrentDirectory(), accredited.Contract_number + DateTime.Now.ToString("yyyy-mm-dd") + ".pdf"), FileMode.OpenOrCreate))
                {
                    memoryStream.CopyTo(fs);
                    fs.Flush();

                    cartaMandato.Path_Contract = $"{configurations.Find(p => p.Configuration_Name == "URL_APP").Configuration_Value}{accredited.Contract_number}{DateTime.Now:yyyy-mm-dd}.pdf";
                    this._AcreditedCartaMandatoWrite.Update(cartaMandato);
                }

                memoryStream.Position = 0;

                FileMail fileMil = new FileMail()
                {
                    FileName = configurations.FirstOrDefault(p => p.Configuration_Name == "CONTRACT_ACCREDITED_NAME").Configuration_Value,
                    File = memoryStream
                };

                Utilities.SendEmail(new List<string> { accredited.Mail_Mandate_Latter, accredited.Mail }, messageMail, mailConf, fileMil);


                return true;
            }
            catch (Exception exception)
            {
                //throw new SystemValidationException($"Error update Spei: {exception}");
                return false;
            }
        }*/
    }
}
