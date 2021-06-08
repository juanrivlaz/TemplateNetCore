using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace TemplateNetCore.Model
{
    public partial class Company
    {
        [NotMapped]
        public string Company_Name { get; set; }
        [NotMapped]
        public string Centro_Costos_Name { get; set; }
    }
}
