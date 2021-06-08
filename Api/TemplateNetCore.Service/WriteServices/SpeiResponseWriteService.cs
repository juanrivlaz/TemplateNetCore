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
        IRetrieveService<Dispertion> _DispertionRetrieveService;
        IWriteRepository<Dispertion> _DispertionWriteRepository;

        public SpeiResponseWriteService(
            IWriteRepository<SpeiResponse> repository,
            IRetrieveService<SpeiResponse> speiResponseRetrieveService,
            IRetrieveService<Dispertion> dispertionRetrieveService,
            IWriteRepository<Dispertion> dispertionWriteRepository

            ) : base(repository)
        {
            this._SpeiResponseRetrieveService = speiResponseRetrieveService;
            this._DispertionRetrieveService = dispertionRetrieveService;
            this._DispertionWriteRepository = dispertionWriteRepository;
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
            try{
                SpeiTransactionResult speiTransactionResult = new SpeiTransactionResult();

                var speiResponse = this._SpeiResponseRetrieveService.Where(p => p.tracking_id == stateChange.Id).FirstOrDefault();

                if (speiResponse == null)
                    throw new SystemValidationException($"Id: {stateChange.Id} Not found");

                var dispertion = this._DispertionRetrieveService.Find(speiResponse.dispertion_id);

                speiResponse.State_Name = stateChange.Estado;

                if (stateChange.CausaDevolucion > 0){
                    speiResponse.Repayment_Id = stateChange.CausaDevolucion;
                }

                speiTransactionResult.Success = base.Update(speiResponse);

                if (speiTransactionResult.Success && stateChange.CausaDevolucion == 0){
                    dispertion.Enabled = true;
                    this._DispertionWriteRepository.Update(dispertion);
                }

                if (speiTransactionResult.Success && stateChange.CausaDevolucion > 0){
                    dispertion.Enabled = false;
                    this._DispertionWriteRepository.Update(dispertion);
                }
                return speiTransactionResult;
            }catch (Exception exception){
                throw new SystemValidationException($"Error update Spei: {exception}");
            }
        }
    }
}
