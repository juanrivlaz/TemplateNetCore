using InsiscoCore.Base.Data;
using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Configurations;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Enum;
using System;
using System.Collections.Generic;
using System.Linq;

namespace TemplateNetCore.Service.RetrieveServices
{
    public class UserRetrieveService : RetrieveService<User>
    {
        IRetrieveService<UserModule> _UserModuleRetrieveService;

        public UserRetrieveService(
            IRetrieveRepository<User> repository,
            IRetrieveService<UserModule> userModuleRetrieveService

            ) : base(repository)
        {
            this._UserModuleRetrieveService = userModuleRetrieveService;
        }

        public override IEnumerable<User> Where(Func<User, bool> predicate)
        {
            var users = this._Repository.Where(predicate).ToList();

            users.ForEach(p =>
            {
                p.Modules = this._UserModuleRetrieveService.Where(m => m.user_id == p.id).ToList();
                p.Type = (int)TemplateNetCoreEnum.UserType.Administrador;
                p.TypeName = TemplateNetCoreEnum.UserType.Administrador.ToString();
            });

            return users;
        }

        public UserLogin RetrieveResult(Login login)
        {
            User user = this._Repository.Where(p => p.Mail.ToLower() == login.Mail.ToLower() && p.Deleted_At == null).FirstOrDefault();

            if (user != null)
            {
                if (!user.Enabled)
                    throw new SystemValidationException("Inactive User!");
                var passwordlogin = InsiscoCore.Utilities.Crypto.MD5.Encrypt(login.Password);
                if (user.Password != passwordlogin)
                    throw new SystemValidationException("Invalid Password!");

                user.Modules = this._UserModuleRetrieveService.Where(p => p.user_id == user.id).ToList();

                return new UserLogin() { Type = 1, User = user };
            }

            throw new SystemValidationException("User not found!");
        }

        public UserLogin RetrieveResult(DisableUser disableUser)
        {
            if (disableUser.Type == 1)
            {
                User user = this._Repository.Where(p => p.id == disableUser.UserId).FirstOrDefault();
                if (disableUser.IsDelete)
                {
                    user.Enabled = false;
                    user.Deleted_At = DateTime.Now;
                }
                else
                    user.Enabled = disableUser.Value;
                
                return new UserLogin() { User = user };
            }

            throw new SystemValidationException("User not found!");
        }
      
    }
}
