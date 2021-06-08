using System;
using System.Collections.Generic;
using System.Text;

namespace TemplateNetCore.Model.Dto.Input
{
    public class DisableCentroCostos
    {
        public int CentroCostosId { get; set; }
        public string Centro_Costos { get; set; }
        public bool Enabled { get; set; }
        public DateTime Deleted_At { get; set; }
        public object CentroCostos { get; set; }
    }
}
