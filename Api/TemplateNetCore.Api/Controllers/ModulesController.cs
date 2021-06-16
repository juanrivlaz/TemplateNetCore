using InsiscoCore.Base.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using TemplateNetCore.Api.Configuration;
using TemplateNetCore.Model;

namespace TemplateNetCore.Api.Controllers
{
    [Route("api/[controller]"), Authorize]
    [ApiController]
    public class ModulesController : CustomController
    {
        IRetrieveService<Module> _AccreditedRetrieveService;

        public ModulesController(
            IRetrieveService<Module> accreditedRetrieveService)
        {
            this._AccreditedRetrieveService = accreditedRetrieveService;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(this._AccreditedRetrieveService.Where(p => p.Enabled == true));
        }
    }
}