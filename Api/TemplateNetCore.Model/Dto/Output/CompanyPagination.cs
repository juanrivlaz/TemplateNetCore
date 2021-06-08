using System.Collections.Generic;

namespace TemplateNetCore.Model.Dto.Output
{
    public class CompanyPagination
    {
        public List<Company> Companies { get; set; }
        public int TotalRecord { get; set; }
    }
}
