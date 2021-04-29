using InsiscoCore.Base.Data;
using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Configurations;
using System;
using System.Linq;

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
                    p => p.Centro_Costos == entity.Centro_Costos
                    ).FirstOrDefault();
                if (companyFound != null)
                    throw new SystemValidationException("Ya se encuentra una compañia con registada con ese centro de costos");

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

            var companyFound = this._CompanyRetrieveService.Where(p => p.Centro_Costos == entity.Centro_Costos && p.id!=entity.id).FirstOrDefault();
            if (companyFound != null)
                throw new SystemValidationException("Ya se encuentra una compañia con registada con ese centro de costos");

            entity.updated_at = DateTime.Now;
            entity.created_at = entity.created_at;

            try
            {
                return base.Update(entity);
            }
            catch (Exception exception) { throw new SystemValidationException($"Error updating Company: {exception.Message}"); }
        }

    }
}
