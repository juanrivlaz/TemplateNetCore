using TemplateNetCore.Model.Enum;

namespace TemplateNetCore.Model.Dto.Input
{
    class UserByType
    {
        public int User_Id { get; set; }
        public TemplateNetCoreEnum.UserType UserType { get; set; }
    }
}
