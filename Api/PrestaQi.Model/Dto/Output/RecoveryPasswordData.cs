using TemplateNetCore.Model.Enum;

namespace TemplateNetCore.Model.Dto.Output
{
    public class RecoveryPasswordData
    {
        public TemplateNetCoreEnum.UserType UserType { get; set; }
        public object Data { get; set; }
        public string Password { get; set; }
        public string Mail { get; set; }
    }
}
