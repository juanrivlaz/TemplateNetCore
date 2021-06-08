using System.ComponentModel.DataAnnotations.Schema;

namespace TemplateNetCore.Model
{
    public partial class UserModule
    {
        [NotMapped]
        public string Module { get; set; }
    }
}
