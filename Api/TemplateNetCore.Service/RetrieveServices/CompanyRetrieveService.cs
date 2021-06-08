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
    public class CompanyRetrieveService : RetrieveService<Company>
    {
        IRetrieveService<User> _UserRetrieveService;
        IRetrieveService<CentroCostos> _CentroCostosRetrieveService;
        public CompanyRetrieveService(
            IRetrieveRepository<Company> repository,
            IRetrieveService<User> userRetrieveService,
            IRetrieveService<CentroCostos> centroCostosRetrieveService
            ) : base(repository)
        {
            this._UserRetrieveService = userRetrieveService;
            this._CentroCostosRetrieveService = centroCostosRetrieveService;
        }
        public override IEnumerable<Company> Where(Func<Company, bool> predicate)
        {
            var list = this._Repository.Where(predicate).ToList();
            return GetList(list);
        }

        public CompanyToken RetrieveResult(ShowToken showToken)
        {
            User user = this._UserRetrieveService.Where(p => p.id == showToken.User_Id && p.Deleted_At == null).FirstOrDefault();

            if (user != null)
            {
                if (!user.Enabled)
                    throw new SystemValidationException("Inactive User!");

                if (user.Password != InsiscoCore.Utilities.Crypto.MD5.Encrypt(showToken.Password))
                    throw new SystemValidationException("Invalid Password!");

                Company company = this._Repository.Where(p => p.id == showToken.Company_Id && p.Deleted_At == null).FirstOrDefault();

                return new CompanyToken() { Company = company };
            }
            throw new SystemValidationException("User not found!");
        }

        public CompanyPagination RetrieveResult(CompanyByPagination companyByPagination)
        {
            int totalRecord = 0;
            if (companyByPagination.Page == 0 || companyByPagination.NumRecord == 0)
            {
                companyByPagination.Page = 1;
                companyByPagination.NumRecord = 20;
            }

            List<Company> companies = new List<Company>();

            if (companyByPagination.Type == 0)
            {
                if (string.IsNullOrEmpty(companyByPagination.Filter))
                {
                    totalRecord = this._Repository.Where(p => p.Deleted_At == null).OrderBy(p => p.id).ToList().Count;
                    companies = this._Repository.Where(p => p.Deleted_At == null).OrderBy(p => p.id).Skip((companyByPagination.Page - 1) * companyByPagination.NumRecord).Take(companyByPagination.NumRecord).ToList();
                }
                else
                    companies = this._Repository.Where(p => p.Deleted_At == null).OrderBy(p => p.id).ToList();
            }
            else
                companies = this._Repository.Where(p => p.Deleted_At == null).OrderBy(p => p.id).ToList();

                companies = GetList(companies).ToList();

            if (companyByPagination.Type == 0 && companyByPagination.Filter.Length > 0)
            {
                var stringProperties = typeof(Company).GetProperties().Where(prop =>
                    prop.PropertyType == companyByPagination.Filter.GetType());

                totalRecord = companies
                        .Where(p => stringProperties.Any(prop => prop.GetValue(p, null) != null && prop.GetValue(p, null).ToString().ToLower().Contains(companyByPagination.Filter.ToLower())))
                        .OrderBy(p => p.id).ToList().Count;

                companies = companies
                        .Where(p => stringProperties.Any(prop => prop.GetValue(p, null) != null && prop.GetValue(p, null).ToString().ToLower().Contains(companyByPagination.Filter.ToLower())))
                        .OrderBy(p => p.id)
                        .Skip((companyByPagination.Page - 1) * companyByPagination.NumRecord)
                        .Take(companyByPagination.NumRecord).ToList();
            }

            return new CompanyPagination() { Companies = companies, TotalRecord = totalRecord };
        }

        

        IEnumerable<Company> GetList(List<Company> list)
        {
            var companies = this._Repository.Where(p => true && p.Enabled == true).ToList();
            var centro_costos = this._CentroCostosRetrieveService.Where(p => true && p.Enabled == true).ToList();

            list.ForEach(p =>
            {
                try
                {
                    p.Company_Name = companies.FirstOrDefault(company => company.id == p.FkCompanyId)?.Empresa;
                    p.Centro_Costos_Name = centro_costos.FirstOrDefault(c => c.id == p.FkCentroCostos)?.Centro_Costos;
                }
                catch (Exception)
                {
                    p.Company_Name = "";
                    p.Centro_Costos_Name = "";
                }
            });

            return list;
        }

        /*public override Company Find(object id)
        {
            var companies = this._Repository.Where(p => true).ToList();

            var company = base.Find(id);
            company.Centro_Costos = companies.Find(p => p.id == company.FkCompanyId).Centro_Costos;

            return company;
        }*/
    }
}
