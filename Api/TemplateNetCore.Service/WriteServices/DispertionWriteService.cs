using InsiscoCore.Base.Data;
using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Configurations;
using System;
using System.Linq;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Spei;

namespace TemplateNetCore.Service.WriteServices
{
    public class DispertionWriteService : WriteService<Dispertion>
    {
        IRetrieveService<Dispertion> _DispertionRetrieveService;
        IProcessService<ordenPagoWS> _OrdenPagoProcessService;
        IWriteService<SpeiResponse> _SpeiWriteService;

        public DispertionWriteService(
            IWriteRepository<Dispertion> repository,
            IRetrieveService<Dispertion> dispertionRetrieveService,
            IProcessService<ordenPagoWS> ordenPagoProcessService,
            IWriteService<SpeiResponse> speiWriteService
            ) : base(repository)
        {
            this._DispertionRetrieveService = dispertionRetrieveService;
            this._OrdenPagoProcessService = ordenPagoProcessService;
            this._SpeiWriteService = speiWriteService;
        }

        public ResponseSpei Create(Accredited accredited)
        {
            try
            {
                var spei = this._OrdenPagoProcessService.ExecuteProcess<Accredited, ResponseSpei>(accredited);

                if (spei.resultado.id > 0)
                {
                    var dispertionFound = this._DispertionRetrieveService.Where(p => p.Clave_Rastreo == spei.resultado.claveRastreo).FirstOrDefault();
                    if (dispertionFound != null)
                        throw new SystemValidationException("Ya se encuentra una solicitud con esa clave de rastreo");

                    Dispertion dispertion = new Dispertion
                    {
                        Company_Id = accredited.Company_Id,
                        Centro_Costos = accredited.Centro_Costos,
                        Empresa = accredited.Empresa,
                        Clabe = accredited.Clabe,
                        Amount = accredited.Amount,
                        Institution_Id = accredited.Institution_Id,
                        Clave_Rastreo = spei.resultado.claveRastreo,
                        Estatus_Request = spei.resultado.id,
                        Description_Request = spei.resultado.descripcionError,
                        Enabled = true,
                        created_at = DateTime.Now,
                        updated_at = DateTime.Now
                    };
                    bool created = base.Create(dispertion);
                    if (created)
                    {
                        //Buscamos el id de la Dispersion
                        var dispertionCreated = _DispertionRetrieveService.Where(p => p.Clave_Rastreo == spei.resultado.claveRastreo && p.Estatus_Request == spei.resultado.id).FirstOrDefault();
                        this._SpeiWriteService.Create(new SpeiResponse()
                        {
                            created_at = DateTime.Now,
                            updated_at = DateTime.Now,
                            dispertion_id = dispertionCreated.id,
                            tracking_id = spei.resultado.id,
                            tracking_key = spei.resultado.claveRastreo
                        });
                    }
                    return spei;
                }
                else
                    throw new SystemValidationException(spei.resultado.descripcionError);
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
