namespace TemplateNetCore.Model.Dto.Input
{
    public class CompanyByPagination
    {
        public int Page { get; set; }
        public int NumRecord { get; set; }
        public int Type { get; set; }
        public string Filter { get; set; }
    }
}

