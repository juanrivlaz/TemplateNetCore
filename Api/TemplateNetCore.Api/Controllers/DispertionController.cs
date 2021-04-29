using InsiscoCore.Base.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using TemplateNetCore.Api.Configuration;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Spei;

namespace TemplateNetCore.Api.Controllers
{
    [Route("api/[controller]"), Authorize]
    [ApiController]
    public class DispertionController : CustomController
    {
        //static volatile public string idCompany;
        IProcessService<ordenPagoWS> _OrdenPagoProcessService;
        IRetrieveService<Company> _CompanyRetrieveService;
        public DispertionController(IProcessService<ordenPagoWS> ordenpagoProcessService, IRetrieveService<Company> companyRetrieveService)
        {
            this._OrdenPagoProcessService = ordenpagoProcessService;
            this._CompanyRetrieveService = companyRetrieveService;

        }

        [HttpPost]
        public IActionResult Post(Accredited accredited)
        {
            // Se desarma el token
            var tokenAccredited = accredited.Token;
            var stream = tokenAccredited;
            var handler = new JwtSecurityTokenHandler();
            var jsonToken = handler.ReadToken(stream);
            var tokenS = jsonToken as JwtSecurityToken;
            // Se Obtiene CompanyId
            var companyId = tokenS.Claims.First(claim => claim.Type == "CompanyId").Value;
            // Se valida que exista la compañia
            var idCompany = this._CompanyRetrieveService.Where(c => c.Enabled == true && c.Centro_Costos == companyId);
            if (idCompany != null)
            {
                // Se asignan los valores a Accreditado para no poner el token o el id compañia como variable GLOBAL
                Accredited accredited1 = new Accredited
                {
                    Company_Id = companyId,
                    Prefijo = accredited.Prefijo,
                    Clabe = accredited.Clabe,
                    First_Name = accredited.First_Name,
                    Last_Name = accredited.Last_Name,
                    Rfc = accredited.Rfc,
                    Institution_Id = accredited.Institution_Id,
                    Amount = accredited.Amount
                };
                // Se Mandan valores a ResponseSpei
                ResponseSpei response = this._OrdenPagoProcessService.ExecuteProcess<Accredited, ResponseSpei>(accredited1);
                // Guardar respuesta de ResponseSpei
                // Retornar respuesta
                return Ok(response, "Request send!");
                //return Ok(idCompany);
            }
            return Success("Company noy found!");
        }
    }
}
