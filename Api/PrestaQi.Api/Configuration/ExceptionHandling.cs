using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using TemplateNetCore.Model.Configurations;
using TemplateNetCore.Model.Dto.Output;
using System;
using System.Net;

namespace TemplateNetCore.Api.Configuration
{
    public class ExceptionHandling : ExceptionFilterAttribute
    {
        public override void OnException(ExceptionContext context)
        {
            Exception exception = context.Exception;

            while (exception.InnerException != null)
                exception = exception.InnerException;

            if (exception is SystemValidationException)
            {
                context.HttpContext.Response.StatusCode = (int)HttpStatusCode.OK;
                context.Result = new ObjectResult(new ResponseResult()
                {
                    Message = exception.Message
                });
            }

            base.OnException(context);
        }
    }
}
