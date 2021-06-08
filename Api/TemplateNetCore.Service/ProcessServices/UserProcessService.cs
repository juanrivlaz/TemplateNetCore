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
        IRetrieveService<Configuration> _ConfigurationRetrieveService;

        public UserProcessService(
            IRetrieveService<User> userRetrieveService,
            IRetrieveService<Configuration> configurationRetrieveService
            )
        {
            this._UserRetrieveService = userRetrieveService;
            this._ConfigurationRetrieveService = configurationRetrieveService;
        }
        public bool ExecuteProcess(string mail)
        {
            bool exist = VerifiyMail(mail);

            if (!exist)
                throw new SystemValidationException("The mail is already registered");

            return true;
        }
        bool VerifiyMail(string mail)
        {
            var userCount = this._UserRetrieveService.Where(p => p.Mail.ToLower() == mail.ToLower() && p.Deleted_At == null).FirstOrDefault();
            if (userCount != null)
                return false;

            return true;
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
        public bool ExecuteProcess(SendMailRecoveryPassword sendMailRecoveryPassword)
        {
            try
            {
                var configurations = this._ConfigurationRetrieveService.Where(p => p.Enabled == true).ToList();
                var mailConf = configurations.FirstOrDefault(p => p.Configuration_Name == "EMAIL_CONFIG");
                var messageConfig = configurations.FirstOrDefault(p => p.Configuration_Name == "RECOVERY_PASSWORD");
                var messageMail = JsonConvert.DeserializeObject<MessageMail>(messageConfig.Configuration_Value);
                string textHtml = File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), messageMail.Message));
                textHtml = textHtml.Replace("{PASSWORD}", sendMailRecoveryPassword.Password);
                textHtml = textHtml.Replace("{NAME}", sendMailRecoveryPassword.Name);
                textHtml = textHtml.Replace("{WHATSAPP}", sendMailRecoveryPassword.Contacts.Find(p => p.id == 1).Contact_Data);
                textHtml = textHtml.Replace("{MAIL_SOPORTE}", sendMailRecoveryPassword.Contacts.Find(p => p.id == 2).Contact_Data);
                textHtml = textHtml.Replace("{PHONE}", sendMailRecoveryPassword.Contacts.Find(p => p.id == 3).Contact_Data);

                messageMail.Message = textHtml;

                Utilities.SendEmail(new List<string> { sendMailRecoveryPassword.Mail }, messageMail, mailConf);
            }
            catch (Exception)
            {

            }


            return true;
        }
    }
}
