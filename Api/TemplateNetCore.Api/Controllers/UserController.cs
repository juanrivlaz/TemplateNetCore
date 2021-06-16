﻿using InsiscoCore.Base.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using TemplateNetCore.Api.Configuration;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Dto;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using System;

namespace TemplateNetCore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : CustomController
    {
        IWriteService<User> _UserWriteService;
        IRetrieveService<User> _UserRetrieveService;
        IProcessService<User> _UserProcessService;
        IRetrieveService<Contact> _ContactRetrieveService;

        public UsersController(
            IWriteService<User> userWriteService,
            IRetrieveService<User> userRetrieveService,
            IProcessService<User> userProcessService,
            IRetrieveService<Contact> contactRetrieveService
            )
        {
            this._UserWriteService = userWriteService;
            this._UserRetrieveService = userRetrieveService;
            this._UserProcessService = userProcessService;
            this._ContactRetrieveService = contactRetrieveService;
        }
        [HttpGet, Route("[action]")]
        public IActionResult GetList([FromQuery] bool onlyActive)
        {
            return Ok(
                onlyActive == true ? this._UserRetrieveService.Where(p => p.Deleted_At == null &&
                p.Enabled == true &&
                p.id != Convert.ToInt32(HttpContext.User.FindFirst("UserId").Value)).OrderBy(p => p.First_Name) :
                this._UserRetrieveService.Where(p => p.Deleted_At == null &&
                p.id != Convert.ToInt32(HttpContext.User.FindFirst("UserId").Value)).OrderBy(p => p.First_Name)
                );
        }

        [HttpPost, Authorize]
        public IActionResult Post(User user)
        {
            return Ok(this._UserWriteService.Create(user), "User created!");
        }

        [HttpPut, Authorize]
        public IActionResult Put(User user)
        {
            return Ok(this._UserWriteService.Update(user), "User updated!");
        }
        [HttpPut, Route("ChangeStatusUser"), Authorize]
        public IActionResult ChangeStatusUser(DisableUser disableUser)
        {
            bool success = ChangeStatus(disableUser).Item1;

            return Ok(success);
        }

        [HttpPut, Route("[action]"), Authorize]
        public IActionResult ChangePassword(ChangePassword changePassword)
        {
            changePassword.Type = int.Parse(HttpContext.User.FindFirst("Type").Value);
            changePassword.User_Id = int.Parse(HttpContext.User.FindFirst("UserId").Value);

            bool changed = false;

            if (changePassword.Type == 1)
                changed = this._UserWriteService.Update<ChangePassword, bool>(changePassword);

            return Ok(changed, "Password Changed!");
        }
        [HttpPut, Route("RecoveryPassword"), AllowAnonymous]
        public IActionResult RecoveryPassword(RecoveryPassword recoveryPassword)
        {
            var contacts = this._ContactRetrieveService.Where(p => p.Enabled == true).ToList();

            var result = this._UserProcessService.ExecuteProcess<RecoveryPassword, RecoveryPasswordData>(recoveryPassword);
            string name = string.Empty;
            bool recovery = false;

            if (result.UserType == Model.Enum.TemplateNetCoreEnum.UserType.Administrador)
            {
                recovery = this._UserWriteService.Update(result.Data as User);
                name = (result.Data as User).First_Name;
            }

            if (recovery)
            {
                return Ok(this._UserProcessService.ExecuteProcess<SendMailRecoveryPassword, bool>(
                    new SendMailRecoveryPassword()
                    {
                        Mail = result.Mail,
                        Password = result.Password,
                        Name = name,
                        Contacts = contacts
                    }
                    ));
            }

            return Ok(recovery);

        }
        (bool, string) ChangeStatus(DisableUser disableUser)
        {
            string name = string.Empty;
            bool success = false;

            var user = this._UserRetrieveService.RetrieveResult<DisableUser, UserLogin>(disableUser);

            
            success = this._UserWriteService.Update<ChangeStatusUser, bool>(new Model.Dto.Input.ChangeStatusUser() { User = user.User });
            name = $"{((User)user.User).First_Name} {((User)user.User).Last_Name}";
            

            return (success, name);
        }
    }
}