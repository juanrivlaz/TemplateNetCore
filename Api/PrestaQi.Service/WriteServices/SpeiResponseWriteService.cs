using InsiscoCore.Base.Data;
using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Configurations;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Spei;
using System;
using System.Linq;

namespace TemplateNetCore.Service.WriteServices
{
    public class SpeiResponseWriteService : WriteService<SpeiResponse>
    {
        IRetrieveService<SpeiResponse> _SpeiResponseRetrieveService;
        IProcessService<ordenPagoWS> _OrdenPagoProcessService;

        public SpeiResponseWriteService(
            IWriteRepository<SpeiResponse> repository,
            IRetrieveService<SpeiResponse> speiResponseRetrieveService,
            IProcessService<ordenPagoWS> ordenPagoProcessService
            ) : base(repository)
        {
            this._SpeiResponseRetrieveService = speiResponseRetrieveService;
            this._OrdenPagoProcessService = ordenPagoProcessService;
        }

        public override bool Create(SpeiResponse entity)
        {
            try
            {
                entity.created_at = DateTime.Now;
                entity.updated_at = DateTime.Now;

                return base.Create(entity);
            }
            catch (Exception exception)
            {
                throw new SystemValidationException($"Error creating Spei: {exception.Message}");
            }

        }

        public SpeiTransactionResult Update(StateChange stateChange)
        {
            try
            {
                SpeiTransactionResult speiTransactionResult = new SpeiTransactionResult();

                var speiResponse = this._SpeiResponseRetrieveService.Where(p => p.tracking_id == stateChange.Id).FirstOrDefault();

                if (speiResponse == null)
                    throw new SystemValidationException($"Id: {stateChange.Id} Not found");

                speiResponse.State_Name = stateChange.Estado;

                if (stateChange.CausaDevolucion > 0)
                {
                    speiResponse.Repayment_Id = stateChange.CausaDevolucion;

                    speiTransactionResult.Message = "Mensaje de Spei";
                }

                speiTransactionResult.Mail = "";//accredited.Mail;
                speiTransactionResult.UserId = 1; // accredited.id;
                speiTransactionResult.Accredited = "Nombre"; //$"{accredited.First_Name} {accredited.Last_Name}";
                speiTransactionResult.Success = base.Update(speiResponse);

                if (speiTransactionResult.Success && stateChange.CausaDevolucion == 0)
                {

                    this._OrdenPagoProcessService.ExecuteProcess<SendSpeiMail, bool>(new SendSpeiMail()
                    {
                        Amount = 10, // monto solicitado
                        Accredited_Id = 1 //accredited.id
                    });
                }

                if (speiTransactionResult.Success && stateChange.CausaDevolucion > 0)
                {
                    //actualizar el status
                    // this._AdvanceWriteRepository.Update(advance);
                }

                return speiTransactionResult;
            }
            catch (Exception exception)
            {
                throw new SystemValidationException($"Error update Spei: {exception}");
            }
        }

    }
}
