﻿namespace PrestaQi.Model.Dto.Input
{
    public class SendSpeiMail
    {
        public int Accredited_Id { get; set; }
        public double Amount { get; set; }
        public string Name { get; set; }
        public Accredited Accredited { get; set; }
        public Advance Advance { get; set; }
    }
}
