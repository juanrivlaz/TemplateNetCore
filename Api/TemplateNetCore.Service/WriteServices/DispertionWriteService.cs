using InsiscoCore.Base.Data;
using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Configurations;
using System;
using System.Linq;

namespace TemplateNetCore.Service.WriteServices
{
    public class DispertionWriteService : WriteService<Dispertion>
    {
        IRetrieveService<Dispertion> _DispertionRetrieveService;

        public DispertionWriteService(
            IWriteRepository<Dispertion> repository,
            IRetrieveService<Dispertion> dispertionRetrieveService
            ) : base(repository)
        {
            this._DispertionRetrieveService = dispertionRetrieveService;
        }

        public override bool Create(Dispertion entity)
        {
            try
            {
                var dispertionFound = this._DispertionRetrieveService.Where(
                    p => p.Clave_Rastreo == entity.Clave_Rastreo
                    ).FirstOrDefault();
                if (dispertionFound != null)
                    throw new SystemValidationException("Ya se encuentra una solicitud con esa clave de rastreo");

                entity.Enabled = true;
                entity.created_at = DateTime.Now;
                entity.updated_at = DateTime.Now;

                return base.Create(entity);
            }
            catch (Exception exception)
            {
                throw new SystemValidationException($"Error creating Dispertion: {exception.Message}");
            }

        }

        public override bool Update(Dispertion entity)
        {
            Dispertion dispertion = this._DispertionRetrieveService.Find(entity.Clave_Rastreo);
            if (dispertion == null)
                throw new SystemValidationException("Dispertion not found");

            var dispertionFound = this._DispertionRetrieveService.Where(p => p.Clave_Rastreo == entity.Clave_Rastreo).FirstOrDefault();

            entity.updated_at = DateTime.Now;
            entity.created_at = entity.created_at;

            try
            {
                return base.Update(entity);
            }
            catch (Exception exception) { throw new SystemValidationException($"Error updating Dispertion: {exception.Message}"); }
        }

    }
}
