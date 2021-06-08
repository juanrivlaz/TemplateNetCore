﻿namespace TemplateNetCore.Model.Dto.Input
{
    public class ConfigurationEmail
    {
        public string Host { get; set; }
        public int Port { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
        public bool EnableSsl { get; set; }
    }
}
