﻿using InsiscoCore.Base.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using TemplateNetCore.Api.Configuration;
using TemplateNetCore.Model;

namespace TemplateNetCore.Api.Controllers
{
    [Route("api/[controller]"), Authorize]
    [ApiController]
    public class CompaniesController : CustomController
    {
        IWriteService<Company> _CompanyWriteService;
        IRetrieveService<Company> _CompanyRetrieveService;

        public CompaniesController(
            IWriteService<Company> companyWriteService,
            IRetrieveService<Company> companyRetrieveService)
        {
            this._CompanyWriteService = companyWriteService;
            this._CompanyRetrieveService = companyRetrieveService;
        }

        [HttpGet, Route("[action]")]
        public IActionResult GetList([FromQuery] bool onlyActive)
        {
            return Ok(
                onlyActive == true ? this._CompanyRetrieveService.Where(p => p.Enabled == true) :
                this._CompanyRetrieveService.Where(p => true)
                );
        }

        [HttpPost]
        public IActionResult Post(Company company)
        {
            return Ok(this._CompanyWriteService.Create(company), "Company created!");
        }

        [HttpPut]
        public IActionResult Put(Company company)
        {
            return Ok(this._CompanyWriteService.Update(company), "Company updated!");
        }

    }
}