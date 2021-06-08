using InsiscoCore.Base.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using TemplateNetCore.Api.Configuration;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Dto.Output;

namespace TemplateNetCore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = "Dispertion")]
    public class DispertionController : CustomController
    {
        IRetrieveService<Company> _CompanyRetrieveService;
        IRetrieveService<CentroCostos> _CentroCostosRetrieveService;
        IWriteService<Dispertion> _DispertionWriteService;
        public DispertionController(
            IRetrieveService<Company> companyRetrieveService,
            IRetrieveService<CentroCostos> centro_costosRetrieveService,
            IWriteService<Dispertion> dispertionWriteService
            )
        {
            this._CompanyRetrieveService = companyRetrieveService;
            this._CentroCostosRetrieveService = centro_costosRetrieveService;
            this._DispertionWriteService = dispertionWriteService;
        }

        [HttpPost]
        public IActionResult Post(Accredited accredited)
        {
            var companyId = Convert.ToInt32(HttpContext.User.Claims.First(claim => claim.Type == "companyId").Value);
            var company = this._CompanyRetrieveService.Where(c => c.Enabled == true && c.TokenEstatus == true && c.id == companyId);
            var centro_costos = this._CentroCostosRetrieveService.Where(c => c.Enabled == true && c.id == company.First().FkCentroCostos);
            if (company != null)
            {
                accredited.Centro_Costos = centro_costos.First().Centro_Costos;
                accredited.Company_Id = companyId;
                accredited.Empresa = company.First().Empresa;
                return Ok(this._DispertionWriteService.Create<Accredited, ResponseSpei>(accredited), "Request send!");
            }
            return Ok("Company noy found!");
        }
    }
}
