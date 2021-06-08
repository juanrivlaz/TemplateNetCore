using InsiscoCore.Utilities.Crypto;
using TemplateNetCore.Model.General;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Reflection.Metadata.Ecma335;
using System.Security.Principal;

namespace TemplateNetCore.Model
{
    public class Accredited
    {
        public string First_Name { get; set; }
        public string Last_Name { get ; set ; }
        public int Company_Id { get; set; }
        public string Centro_Costos { get; set; }
        public string Empresa { get; set; }
        public int Amount { get; set; }
        public string Rfc { get; set; }
        public int Institution_Id { get; set; }
        public string Clabe { get; set; }
        public string Prefijo { get ; set; }
    }
}
