using InsiscoCore.Base.Data;
using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using Newtonsoft.Json;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Configurations;
using TemplateNetCore.Model.Dto;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Service.Tools;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Metadata.Ecma335;

namespace TemplateNetCore.Service.WriteServices
{
    public class UserWriteService : WriteService<User>
    {
        IProcessService<User> _UserProcessService;
        IRetrieveService<User> _UserRetrieveService;

        public UserWriteService(
            IWriteRepository<User> repository,
            IRetrieveService<User> userRetrieveService,
            IProcessService<User> userProcessService
            ) : base(repository)
        {
            this._UserRetrieveService = userRetrieveService;
            this._UserProcessService = userProcessService;
        }

        public override bool Create(User entity)
        {
            this._UserProcessService.ExecuteProcess<string, bool>(entity.Mail);

            try
            {
                string password = Utilities.GetPasswordRandom();

                entity.Enabled = true;
                entity.First_Login = true;
                entity.Password = InsiscoCore.Utilities.Crypto.MD5.Encrypt(password);
                entity.created_at = DateTime.Now;
                entity.updated_at = DateTime.Now;

                bool create = base.Create(entity);

                if (create)
                {
                    try
                    {
                        // SendMail(entity.Mail, password, entity.First_Name);
                    }
                    catch (Exception)
                    {
                    }
                }

                return create;
            }
            catch (Exception exception)
            {
                throw new SystemValidationException($"Error creating user: {exception.Message}");
            }

        }

        public override bool Update(User entity)
        {
            User user = this._UserRetrieveService.Find(entity.id);
            if (user == null)
                throw new SystemValidationException("User not found");

            if (string.IsNullOrEmpty(entity.Password))
                entity.Password = user.Password;

            entity.updated_at = DateTime.Now;
            entity.created_at = entity.created_at;  

            try
            {
                bool updated = base.Update(entity);

                return updated;
            }
            catch (Exception exception) { throw new SystemValidationException($"Error updating User: {exception.Message}");  }
        }

        public override bool Create(IEnumerable<User> entities)
        {
            try
            {
                Dictionary<string, string> mails = new Dictionary<string, string>();

                entities.ToList().ForEach(p =>
                {
                    string password = Utilities.GetPasswordRandom();
                    p.Password = InsiscoCore.Utilities.Crypto.MD5.Encrypt(password);
                    p.created_at = DateTime.Now;
                    p.updated_at = DateTime.Now;
                    p.Enabled = true;
                    p.First_Login = true;

                    mails.Add(p.Mail, password);
                });

                bool created = base.Create(entities);

                entities.ToList().ForEach(p =>
                {

                    try
                    {
                        //SendMail(p.Mail, mails[p.Mail], p.First_Name);
                    }
                    catch (Exception)
                    {
                    }
                });

                return created;
            }
            catch (Exception exception)
            {
                throw new SystemValidationException($"Error creating users: {exception.Message}");
            }
        }
    }
}
