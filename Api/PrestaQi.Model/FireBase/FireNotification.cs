using System;
using System.Collections.Generic;
using System.Text;

namespace TemplateNetCore.Model.FireBase
{
    public class FireNotification
    {
        public string body { get; set; }
        public string title { get; set; }
        public int badge { get; set; }
    }
}
