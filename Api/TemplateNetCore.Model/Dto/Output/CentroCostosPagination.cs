using System.Collections.Generic;

namespace TemplateNetCore.Model.Dto.Output
{
    public class CentroCostosPagination
    {
        public List<CentroCostos> CentroCostos { get; set; }
        public int TotalRecord { get; set; }
    }
}
