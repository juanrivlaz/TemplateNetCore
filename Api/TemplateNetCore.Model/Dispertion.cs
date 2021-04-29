using TemplateNetCore.Model.General;
using System.ComponentModel.DataAnnotations.Schema;

namespace TemplateNetCore.Model
{
    [Table("dispertions")]
    public class Dispertion : Entity<int>
    {
        [Column("company_id")]
        public string Company_Id { get; set; }
        [Column("clabe")]
        public string Clabe { get; set; }
        [Column("amount")]
        public decimal Amount { get; set; }
        [Column("institution_id")]
        public int Institution_Id { get; set; }
        [Column("clave_rastreo")]
        public string Clave_Rastreo { get; set; }
        [Column("estatus_request")]
        public int Estatus_Request { get; set; }
        [Column("description_request")]
        public string Description_Request { get; set; }
        [Column("enabled")]
        public bool Enabled { get; set; }
    }
}
