using TemplateNetCore.Model.General;
using System.ComponentModel.DataAnnotations.Schema;

namespace TemplateNetCore.Model
{
    [Table("companies")]
    public class Company : Entity<int>
    {
        [Column("centro_costos")]
        public string Centro_Costos { get; set; }
        [Column("rfc")]
        public string Rfc { get; set; }
        [Column("razon_social")]
        public string Razon_Social { get; set; }
        [Column("representante_legal")]
        public string Representante_Legal { get; set; }
        [Column("empresa")]
        public string Empresa { get; set; }
        [Column("enabled")]
        public bool Enabled { get; set; }
    }
}
