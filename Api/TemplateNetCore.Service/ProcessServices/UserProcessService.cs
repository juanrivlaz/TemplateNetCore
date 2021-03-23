using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using Microsoft.VisualBasic.FileIO;
using MoreLinq;
using Newtonsoft.Json;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Configurations;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Enum;
using TemplateNetCore.Service.Tools;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace TemplateNetCore.Service.ProcessServices
{
    public class UserProcessService : ProcessService<User>
    {
        IRetrieveService<User> _UserRetrieveService;

        public UserProcessService(
            IRetrieveService<User> userRetrieveService
            )
        {
            this._UserRetrieveService = userRetrieveService;
        }

        public RecoveryPasswordData ExecuteProcess(RecoveryPassword recoveryPassword)
        {
            RecoveryPasswordData recoveryPasswordData = new RecoveryPasswordData();

            var userMail = this._UserRetrieveService.Where(p => p.Mail.ToLower() == recoveryPassword.Mail.ToLower() && p.Deleted_At == null).FirstOrDefault();

            if (userMail == null)
                throw new SystemValidationException("The mail is not registered");

            string password = Utilities.GetPasswordRandom();
            recoveryPasswordData.Password = password;
            string passwordEncrypt = InsiscoCore.Utilities.Crypto.MD5.Encrypt(password);
            
            if (userMail != null)
            {
                recoveryPasswordData.Mail = userMail.Mail;
                userMail.Password = passwordEncrypt;
                recoveryPasswordData.Data = userMail;
                recoveryPasswordData.UserType = TemplateNetCoreEnum.UserType.Administrador;
            }

            return recoveryPasswordData;
        }
    }
}
