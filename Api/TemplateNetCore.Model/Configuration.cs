using TemplateNetCore.Model.General;
using System.ComponentModel.DataAnnotations.Schema;

namespace TemplateNetCore.Model
{
    [Table("configurations")]
    public class Configuration : Entity<int>
    {
        [Column("configuration_name")]
        public string Configuration_Name { get; set; }
        [Column("configuration_value")]
        public string Configuration_Value { get; set; }
        [Column("enabled")]
        public bool Enabled { get; set; }
    }
}
