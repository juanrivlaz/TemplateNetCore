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
    public class CentroCostosWriteService : WriteService<CentroCostos>
    {
        IRetrieveService<CentroCostos> _CentroCostosRetrieveService;

        public CentroCostosWriteService(
            IWriteRepository<CentroCostos> repository,
            IRetrieveService<CentroCostos> centroCostosRetrieveService
            ) : base(repository)
        {
            this._CentroCostosRetrieveService = centroCostosRetrieveService;
        }

        public override bool Create(CentroCostos entity)
        {
            try
            {
                if(entity.Centro_Costos=="" || entity.Descripcion=="")
                    throw new SystemValidationException("Debes ingresar el centro de costos y la descripción.");

                var centroCostosFound = this._CentroCostosRetrieveService.Where(
                    p => p.Centro_Costos.ToUpper() == entity.Centro_Costos.ToUpper()
                    ).FirstOrDefault();
                if (centroCostosFound != null)
                    throw new SystemValidationException("The centro costos is already registered.");

                entity.Enabled = true;
                entity.created_at = DateTime.Now;
                entity.updated_at = DateTime.Now;

                return base.Create(entity);
            }
            catch (Exception exception)
            {
                throw new SystemValidationException($"Error creating Centro Costos: {exception.Message}");
            }

        }

        public override bool Update(CentroCostos entity)
        {
            CentroCostos centroCostos = this._CentroCostosRetrieveService.Find(entity.id);
            if (centroCostos == null)
                throw new SystemValidationException("Centro Costos not found");

            var centroCostosFound = this._CentroCostosRetrieveService.Where(p => p.Centro_Costos.ToUpper() == entity.Centro_Costos.ToUpper() && p.id!=entity.id).FirstOrDefault();
            if (centroCostosFound != null)
                throw new SystemValidationException("The Centro Costos is already registered.");

            entity.updated_at = DateTime.Now;
            entity.created_at = entity.created_at;
            try
            {
                return base.Update(entity);
            }
            catch (Exception exception) { throw new SystemValidationException($"Error updating CentroCostos: {exception.Message}"); }
        }

        public bool Update(DisableCentroCostos disableCentroCostos)
        {
            CentroCostos centroCostos = this._CentroCostosRetrieveService.Find(disableCentroCostos.CentroCostosId);
            if (centroCostos == null)
                throw new SystemValidationException("Centro Costos not found");

            centroCostos.Enabled = false;
            centroCostos.Deleted_At = DateTime.Now;
            try
            {
                return base.Update(centroCostos);
            }
            catch (Exception exception) { throw new SystemValidationException($"Error change estatus Centro Costos: {exception.Message}"); }
        }

        

    }
}
