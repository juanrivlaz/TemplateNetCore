using System;

namespace TemplateNetCore.Model.Configurations
{
    public class SystemValidationException : Exception
    {
        public SystemValidationException(string message) : base(message)
        {
            
        }
    }
}
