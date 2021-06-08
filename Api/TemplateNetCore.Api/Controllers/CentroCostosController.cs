using InsiscoCore.Base.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using TemplateNetCore.Api.Configuration;
using TemplateNetCore.Model;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using System;
using System.Linq;
using System.Text;
using TemplateNetCore.Model.Enum;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Dto;
using TemplateNetCore.Model.Configurations;
using Newtonsoft.Json;

namespace TemplateNetCore.Api.Controllers
{
    [Route("api/[controller]"), Authorize]
    [ApiController]
    public class CentroCostosController : CustomController
    {
        IConfiguration _Configuration;
        IWriteService<CentroCostos> _CentroCostosWriteService;
        IRetrieveService<CentroCostos> _CentroCostosRetrieveService;

        public CentroCostosController(
            IConfiguration configuration,
            IWriteService<CentroCostos> centroCostosWriteService,
            IRetrieveService<CentroCostos> centroCostosRetrieveService)
        {
            this._Configuration = configuration;
            this._CentroCostosWriteService = centroCostosWriteService;
            this._CentroCostosRetrieveService = centroCostosRetrieveService;
        }

        [HttpPost, Route("GetList")]
        public IActionResult GetList(CentroCostosByPagination centroCostosByPagination)
        {
            var result = this._CentroCostosRetrieveService.RetrieveResult<CentroCostosByPagination, CentroCostosPagination>(centroCostosByPagination);
            return Ok(result);
        }

        [HttpGet, Route("[action]")]
        public IActionResult GetList([FromQuery] bool onlyActive)
        {
            return Ok(
                onlyActive == true ? this._CentroCostosRetrieveService.Where(p => p.Enabled == true) :
                this._CentroCostosRetrieveService.Where(p => p.Enabled == true)
                );
        }

        [HttpPost]
        public IActionResult Post(CentroCostos centroCostos)
        {
            var create = this._CentroCostosWriteService.Create(centroCostos);
            if (create){
                return Ok(create, "Centro Costos created!");
            }else{
                return Ok(create, "Error creating Centro Costos!");
            }
        }

        [HttpPut]
        public IActionResult Put(CentroCostos centroCostos)
        {
            return Ok(this._CentroCostosWriteService.Update(centroCostos), "Centro Costos updated!");
        }

        [HttpPut, Route("ChangeStatusCentroCostos"), Authorize]
        public IActionResult ChangeStatusCentroCostos(DisableCentroCostos disableCentroCostos)
        {
            return Ok(this._CentroCostosWriteService.Update<DisableCentroCostos, bool>(disableCentroCostos));
        }
    }
}