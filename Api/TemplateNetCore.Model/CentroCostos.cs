using TemplateNetCore.Model.General;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace TemplateNetCore.Model
{
    [Table("centrocostos")]
    public partial class CentroCostos : Entity<int>
    {
        [Column("centro_costos")]
        public string Centro_Costos { get; set; }
        [Column("descripcion")]
        public string Descripcion { get; set; }
        [Column("enabled")]
        public bool Enabled { get; set; }
        [Column("deleted_at")]
        public DateTime? Deleted_At { get; set; }
    }
}
