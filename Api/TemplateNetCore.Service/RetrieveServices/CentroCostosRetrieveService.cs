using InsiscoCore.Base.Data;
using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using OpenXmlPowerTools;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Configurations;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using TemplateNetCore.Model.Dto;
using Microsoft.AspNetCore.Http;

namespace TemplateNetCore.Service.RetrieveServices
{
    public class CentroCostosRetrieveService : RetrieveService<CentroCostos>
    {
        IRetrieveService<User> _UserRetrieveService;
        public CentroCostosRetrieveService(
            IRetrieveRepository<CentroCostos> repository,
            IRetrieveService<User> userRetrieveService
            ) : base(repository)
        {
            this._UserRetrieveService = userRetrieveService;
        }
        /*public override IEnumerable<CentroCostos> Where(Func<CentroCostos, bool> predicate)
        {
            var list = this._Repository.Where(predicate).ToList();
            return GetList(list);
        }*/

        public CentroCostosPagination RetrieveResult(CentroCostosByPagination centroCostosByPagination)
        {
            int totalRecord = 0;
            if (centroCostosByPagination.Page == 0 || centroCostosByPagination.NumRecord == 0)
            {
                centroCostosByPagination.Page = 1;
                centroCostosByPagination.NumRecord = 20;
            }

            List<CentroCostos> listcentroCostos = new List<CentroCostos>();

            if (centroCostosByPagination.Type == 0)
            {
                if (string.IsNullOrEmpty(centroCostosByPagination.Filter))
                {
                    totalRecord = this._Repository.Where(p => p.Deleted_At == null).OrderBy(p => p.id).ToList().Count;
                    listcentroCostos = this._Repository.Where(p => p.Deleted_At == null).OrderBy(p => p.id).Skip((centroCostosByPagination.Page - 1) * centroCostosByPagination.NumRecord).Take(centroCostosByPagination.NumRecord).ToList();
                }
                else
                    listcentroCostos = this._Repository.Where(p => p.Deleted_At == null).OrderBy(p => p.id).ToList();
            }
            else
                listcentroCostos = this._Repository.Where(p => p.Deleted_At == null).OrderBy(p => p.id).ToList();

            if (centroCostosByPagination.Type == 0 && centroCostosByPagination.Filter.Length > 0)
            {
                var stringProperties = typeof(CentroCostos).GetProperties().Where(prop =>
                    prop.PropertyType == centroCostosByPagination.Filter.GetType());

                totalRecord = listcentroCostos
                        .Where(p => stringProperties.Any(prop => prop.GetValue(p, null) != null && prop.GetValue(p, null).ToString().ToLower().Contains(centroCostosByPagination.Filter.ToLower())))
                        .OrderBy(p => p.id).ToList().Count;

                listcentroCostos = listcentroCostos
                        .Where(p => stringProperties.Any(prop => prop.GetValue(p, null) != null && prop.GetValue(p, null).ToString().ToLower().Contains(centroCostosByPagination.Filter.ToLower())))
                        .OrderBy(p => p.id)
                        .Skip((centroCostosByPagination.Page - 1) * centroCostosByPagination.NumRecord)
                        .Take(centroCostosByPagination.NumRecord).ToList();
            }

            return new CentroCostosPagination() { CentroCostos = listcentroCostos, TotalRecord = totalRecord };
        }
        /*IEnumerable<Company> GetList(List<Company> list)
        {
            var centroCostos = this._Repository.Where(p => true && p.Enabled == true).ToList();

            list.ForEach(p =>
            {
                try
                {
                    p.Company_Name = centroCostos.FirstOrDefault(company => company.id == p.FkCompanyId)?.Centro_Costos;
                }
                catch (Exception)
                {
                    p.Company_Name = "";
                }
            });

            return list;
        }*/
    }
}
