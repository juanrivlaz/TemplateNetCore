using System.ComponentModel.DataAnnotations.Schema;

namespace TemplateNetCore.Model
{
    public partial class User
    {
        [NotMapped]
        public int Type { get; set; }
        [NotMapped]
        public string TypeName { get; set; }
    }
}
