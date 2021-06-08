using System;
using System.Collections.Generic;
using System.Text;

namespace TemplateNetCore.Model.Dto.Input
{
    public class DisableCompany
    {
        public int CompanyId { get; set; }
        public string Centro_Costos { get; set; }
        public bool Enabled { get; set; }
        public bool TokenEstatus { get; set; }
        public DateTime Deleted_At { get; set; }
        public object Company { get; set; }
    }
}
