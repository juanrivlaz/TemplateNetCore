using TemplateNetCore.Model.Enum;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace TemplateNetCore.Model
{
    public partial class Notification
    {
        [NotMapped]
        public dynamic Data { get; set; }
        
    }
}
