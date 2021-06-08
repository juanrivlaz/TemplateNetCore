using TemplateNetCore.Model.General;
using System.ComponentModel.DataAnnotations.Schema;

namespace TemplateNetCore.Model
{
    [Table("usermodules")]
    public partial class UserModule : Entity<int>
    {
        public int user_id { get; set; }
        public int module_id { get; set; }
    }
}