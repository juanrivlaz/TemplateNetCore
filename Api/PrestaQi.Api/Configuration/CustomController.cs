using Microsoft.AspNetCore.Mvc;
using TemplateNetCore.Model.Dto.Output;

namespace TemplateNetCore.Api.Configuration
{
    public class CustomController : ControllerBase
    {
        public ActionResult Success(string message)
        {
            return base.Ok(new ResponseResult()
            {
                Success = true,
                Message = message
            });
        }

        public ActionResult Ok(object data, string message = "")
        {
            return base.Ok(new ResponseResult()
            {
                Success = true,
                Data = data,
                Message = message
            });
        }

        public ActionResult NotFound(string message)
        {
            return base.NotFound(new ResponseResult()
            {
                Message = message
            });
        }
    }
}
