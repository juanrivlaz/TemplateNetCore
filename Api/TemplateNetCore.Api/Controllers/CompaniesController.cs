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
    public class CompaniesController : CustomController
    {
        IConfiguration _Configuration;
        IWriteService<Company> _CompanyWriteService;
        IRetrieveService<Company> _CompanyRetrieveService;
        IRetrieveService<User> _UserRetrieveService;

        public CompaniesController(
            IConfiguration configuration,
            IWriteService<Company> companyWriteService,
            IRetrieveService<Company> companyRetrieveService,
            IRetrieveService<User> userRetrieveService)
        {
            this._Configuration = configuration;
            this._CompanyWriteService = companyWriteService;
            this._CompanyRetrieveService = companyRetrieveService;
            this._UserRetrieveService = userRetrieveService;
        }

        [HttpPost, Route("GetList")]
        public IActionResult GetList(CompanyByPagination companyByPagination)
        {
            var result = this._CompanyRetrieveService.RetrieveResult<CompanyByPagination, CompanyPagination>(companyByPagination);
            return Ok(result);
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
            var create = this._CompanyWriteService.Create(company);
            if (create) {
                var tokenString = GenerateJSONWebToken(company);
                company.TokenCompany = tokenString;
                var update = this._CompanyWriteService.Update(company);
                return Ok(update, "Company created!");
            }else{
                return Ok(create, "Error creating Company!");
            }
        }

        [HttpPut]
        public IActionResult Put(Company company)
        {
            return Ok(this._CompanyWriteService.Update(company), "Company updated!");
        }

        public string GenerateJSONWebToken(Company company)
        {
            int companyId = 0;
            companyId = company.id;
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_Configuration["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var claims = new[] {
                new Claim("Type", 2.ToString()),
                new Claim("TypeName", ((TemplateNetCoreEnum.UserType)4).ToString()),
                new Claim("companyId", companyId.ToString()),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            }.ToList();
            var token = new JwtSecurityToken(_Configuration["Jwt:Issuer"],
              _Configuration["Jwt:Issuer"],
              claims,
              expires: DateTime.Now.AddYears(Convert.ToInt32(99)),
              signingCredentials: credentials);
            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        [HttpPut, Route("ChangeStatusCompany"), Authorize]
        public IActionResult ChangeStatusCompany(DisableCompany disableCompany)
        {
            return Ok(this._CompanyWriteService.Update<DisableCompany, bool>(disableCompany));
        }

        [HttpPost, Route("ShowToken"), Authorize]
        public IActionResult ShowToken(ShowToken showToken)
        {
            var User_Id = HttpContext.User.Claims.First(claim => claim.Type == "UserId").Value;
            showToken.User_Id = Convert.ToInt32(User_Id);
            var company = this._CompanyRetrieveService.RetrieveResult<ShowToken, CompanyToken>(showToken);
            return Ok(company);
        }

    }
}