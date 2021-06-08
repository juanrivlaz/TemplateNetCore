using InsiscoCore.Base.Data;
using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Configurations;
using System;
using System.Linq;
using TemplateNetCore.Model.Dto.Input;
using Microsoft.Extensions.Configuration;

namespace TemplateNetCore.Service.WriteServices
{
    public class CompanyWriteService : WriteService<Company>
    {
        IRetrieveService<Company> _CompanyRetrieveService;

        public CompanyWriteService(
            IWriteRepository<Company> repository,
            IRetrieveService<Company> companyRetrieveService
            ) : base(repository)
        {
            this._CompanyRetrieveService = companyRetrieveService;
        }

        public override bool Create(Company entity)
        {
            try
            {
                var companyFound = this._CompanyRetrieveService.Where(
                    p => p.FkCentroCostos == entity.FkCentroCostos
                    ).FirstOrDefault();
                if (companyFound != null)
                    throw new SystemValidationException("The company is already registered.");

                entity.TokenEstatus = true;
                entity.Enabled = true;
                entity.created_at = DateTime.Now;
                entity.updated_at = DateTime.Now;

                return base.Create(entity);
            }
            catch (Exception exception)
            {
                throw new SystemValidationException($"Error creating Company: {exception.Message}");
            }

        }

        public override bool Update(Company entity)
        {
            Company company = this._CompanyRetrieveService.Find(entity.id);
            if (company == null)
                throw new SystemValidationException("Company not found");

            var companyFound = this._CompanyRetrieveService.Where(p => p.FkCentroCostos == entity.FkCentroCostos && p.id!=entity.id).FirstOrDefault();
            if (companyFound != null)
                throw new SystemValidationException("The center is already registered.");

            entity.updated_at = DateTime.Now;
            entity.created_at = entity.created_at;
            try
            {
                return base.Update(entity);
            }
            catch (Exception exception) { throw new SystemValidationException($"Error updating Company: {exception.Message}"); }
        }

        public bool Update(DisableCompany disableCompany)
        {
            Company company = this._CompanyRetrieveService.Find(disableCompany.CompanyId);
            if (company == null)
                throw new SystemValidationException("Company not found");

            company.Enabled = false;
            company.TokenEstatus = false;
            company.Deleted_At = DateTime.Now;
            try
            {
                return base.Update(company);
            }
            catch (Exception exception) { throw new SystemValidationException($"Error change estatus Company: {exception.Message}"); }
        }

        

    }
}
