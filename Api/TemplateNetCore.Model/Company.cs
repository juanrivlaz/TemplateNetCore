using TemplateNetCore.Model.General;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace TemplateNetCore.Model
{
    [Table("companies")]
    public partial class Company : Entity<int>
    {
        [Column("fk_centro_costos")]
        public int FkCentroCostos { get; set; }
        [Column("rfc")]
        public string Rfc { get; set; }
        [Column("razon_social")]
        public string Razon_Social { get; set; }
        [Column("representante_legal")]
        public string Representante_Legal { get; set; }
        [Column("empresa")]
        public string Empresa { get; set; }
        [Column("token_company")]
        public string TokenCompany { get; set; }
        [Column("token_estatus")]
        public bool TokenEstatus { get; set; }
        [Column("enabled")]
        public bool Enabled { get; set; }
        [Column("fk_company_id")]
        public int? FkCompanyId { get; set; }
        [Column("url_response")]
        public string UrlResponse { get; set; }
        [Column("deleted_at")]
        public DateTime? Deleted_At { get; set; }
    }
}
