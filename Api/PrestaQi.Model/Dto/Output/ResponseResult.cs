namespace TemplateNetCore.Model.Dto.Output
{
    public class ResponseResult
    {
        public bool Success { get; set; }
        public object Data { get; set; }
        public string Message { get; set; }
    }
}
