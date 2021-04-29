using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using InsiscoCore.Base.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using TemplateNetCore.Api.Configuration;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;

namespace TemplateNetCore.Api.Controllers
{
    [Route("api/[controller]"), Authorize]
    [ApiController]
    public class TestController : CustomController
    {

        [HttpPost, Route("Pruebas")]
        public IActionResult Mensaje(string nombre)
        {
            string mensaje = "Hola Mundo, tu nombre es: "+nombre;
            return Ok(mensaje);
        }
    }
}