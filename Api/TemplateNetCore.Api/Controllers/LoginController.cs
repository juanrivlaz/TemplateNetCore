using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using InsiscoCore.Base.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using TemplateNetCore.Api.Configuration;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Enum;

namespace TemplateNetCore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : CustomController
    {
        IRetrieveService<User> _UserRetrieveService;
        IConfiguration _Configuration;
        

        public LoginController(
            IConfiguration configuration,
            IRetrieveService<User> userRetrieveService
            )
        {
            this._UserRetrieveService = userRetrieveService;
            this._Configuration = configuration;
        }

        [HttpPost, AllowAnonymous]
        public IActionResult Login(Login login)
        {
            IActionResult response = Unauthorized();

            var user = this._UserRetrieveService.RetrieveResult<Login, UserLogin>(login);
            string contract = string.Empty;

            if (user != null)
            {
                var tokenString = GenerateJSONWebToken(user);

                    return Ok(new
                    {
                        Token = tokenString,
                        User = user.User,
                        Type = user.Type,
                        TypeName = ((TemplateNetCoreEnum.UserType)user.Type).ToString()
                    });
                
            }

            return Success("User not found");
        }

        private string GenerateJSONWebToken(UserLogin user)
        {
            string nameComplete = string.Empty;
            string mail = string.Empty;
            int id = 0;

            nameComplete = $"{((User)user.User).First_Name.TrimStart().TrimEnd()} {((User)user.User).Last_Name.TrimStart().TrimEnd()}";
            mail = ((User)user.User).Mail;
            id = ((User)user.User).id;

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_Configuration["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);


            var claims = new[] {
                new Claim(JwtRegisteredClaimNames.GivenName, nameComplete),
                new Claim(JwtRegisteredClaimNames.Email, mail),
                new Claim("Type", user.Type.ToString()),
                new Claim("TypeName", ((TemplateNetCoreEnum.UserType)user.Type).ToString()),
                new Claim("UserId", id.ToString()),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            }.ToList();

            var token = new JwtSecurityToken(_Configuration["Jwt:Issuer"],
              _Configuration["Jwt:Issuer"],
              claims,
              expires: DateTime.Now.AddMinutes(Convert.ToInt32(_Configuration["Jwt:Duration"])),
              signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}