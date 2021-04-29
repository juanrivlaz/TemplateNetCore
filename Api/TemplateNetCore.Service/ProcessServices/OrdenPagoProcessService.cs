using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using Newtonsoft.Json;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Spei;
using TemplateNetCore.Service.Tools;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using iText.Kernel.Pdf;
using iText.Html2pdf;
using TemplateNetCore.Model.Configurations;

namespace TemplateNetCore.Service.ProcessServices
{
    public class OrdenPagoProcessService : ProcessService<ordenPagoWS>
    {
        IRetrieveService<Accredited> _AccreditedRetrieveService;
        IRetrieveService<Configuration> _ConfigurationRetrieveService;
        IRetrieveService<Company> _CompanyRetrieveService;
        IWriteService<Dispertion> _DispertionWriteService;


        public OrdenPagoProcessService(
           IRetrieveService<Accredited> accreditedRetrieveService,
           IRetrieveService<Configuration> configurationRetrieveService,
           IRetrieveService<Company> companyRetrieveService,
           IWriteService<Dispertion> dispertionWriteService
            )
        {

            this._AccreditedRetrieveService = accreditedRetrieveService;
            this._ConfigurationRetrieveService = configurationRetrieveService;
            this._CompanyRetrieveService = companyRetrieveService;
            this._DispertionWriteService = dispertionWriteService;
        }

        public ResponseSpei ExecuteProcess(Accredited accredited)
        {
            try
            {
                var configurations = this._ConfigurationRetrieveService.Where(p => p.Enabled == true).ToList();
                // Cambiar a mi ruta para que encuentre una ruta
                byte[] file = File.ReadAllBytes(Path.Combine(Directory.GetCurrentDirectory(), configurations.Find(p => p.Configuration_Name == "CERTIFIED_FTP").Configuration_Value));
                string prefix = accredited.Prefijo ?? "PR";
                var company = this._CompanyRetrieveService.Where(c => c.Centro_Costos == accredited.Company_Id).ToList();
                CryptoHandler crypto = new CryptoHandler();
                crypto.password = configurations.Find(p => p.Configuration_Name == "CERTIFIED_PASSWORD").Configuration_Value;
                ordenPagoWS ordenPago = new ordenPagoWS();
                ordenPago.empresa = company.Find(c => c.Centro_Costos == accredited.Company_Id && c.Enabled == true).Centro_Costos;
                ordenPago.claveRastreo = $"{prefix}{accredited.Company_Id}{DateTime.Now:yyyyMMdd}";
                ordenPago.referenciaNumerica = Convert.ToInt32(DateTime.Now.ToString("yyMMdd"));
                ordenPago.cuentaBeneficiario = accredited.Clabe;
                ordenPago.tipoPago = Convert.ToInt32(configurations.Find(p => p.Configuration_Name == "PAYMENT_TYPE").Configuration_Value);
                ordenPago.nombreBeneficiario = $"{accredited.First_Name} {accredited.Last_Name}";
                ordenPago.rfcCurpBeneficiario = accredited.Rfc;
                ordenPago.topologia = configurations.Find(p => p.Configuration_Name == "TOPOLOGY").Configuration_Value;
                ordenPago.institucionOperante = Convert.ToInt32(configurations.Find(p => p.Configuration_Name == "OPERATING_INSTITUTION").Configuration_Value);
                ordenPago.tipoCuentaBeneficiario = Convert.ToInt32(configurations.Find(p => p.Configuration_Name == "TYPE_BENEFICIARY_ACCOUNT").Configuration_Value);
                ordenPago.conceptoPago = configurations.Find(p => p.Configuration_Name == "PAYMENT_CONCEPT").Configuration_Value;
                ordenPago.institucionContraparte = accredited.Institution_Id;
                ordenPago.monto = decimal.Add(Convert.ToDecimal(accredited.Amount), .00m);
                ordenPago.tipoCuentaBeneficiarioSpecified = true;
                ordenPago.institucionOperanteSpecified = true;
                ordenPago.institucionContraparteSpecified = true;
                ordenPago.tipoPagoSpecified = true;
                ordenPago.referenciaNumericaSpecified = true;
                ordenPago.montoSpecified = true;
                //ordenPago.firma = crypto.sign(ordenPago, file);
                
                // Return Produccion
                var resultado = CallService(ordenPago, configurations);
                if (resultado.resultado.id > 0) resultado.resultado.claveRastreo = ordenPago.claveRastreo;
                // Guardar datos en Dispertion
                Dispertion dispertion = new Dispertion
                {
                    Company_Id = accredited.Company_Id,
                    Clabe = ordenPago.cuentaBeneficiario,
                    Amount = ordenPago.monto,
                    Institution_Id = ordenPago.institucionContraparte,
                    Clave_Rastreo = ordenPago.claveRastreo,
                    Estatus_Request = resultado.resultado.id,
                    Description_Request = resultado.resultado.descripcionError
                };
                var crearDispertion = this._DispertionWriteService.Create(dispertion);
                return resultado;
            }
            catch (Exception exception)
            {
                return new ResponseSpei()
                {
                    resultado = new resultado()
                    {
                        id = -1,
                        descripcionError = exception.Message
                    }
                };
            }
        }

        ResponseSpei CallService(ordenPagoWS ordenPagoWS, List<Configuration> configurations)
        {
            string baseUri = configurations.Find(p => p.Configuration_Name == "API_SPEI").Configuration_Value;
            string method = configurations.Find(p => p.Configuration_Name == "API_ORDER_REGISTER").Configuration_Value;

            var json = Newtonsoft.Json.JsonConvert.SerializeObject(ordenPagoWS);

            var request = (HttpWebRequest)WebRequest.Create($"{baseUri}{method}");
            request.Method = "PUT";
            request.ContentType = "application/json";
            request.Accept = "application/json";

            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
            {
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();
            }

            using (WebResponse response2 = request.GetResponse())
            {
                using (Stream strReader = response2.GetResponseStream())
                {
                    if (strReader == null) return null;
                    using (StreamReader objReader = new StreamReader(strReader))
                    {
                        string responseBody = objReader.ReadToEnd();
                        return JsonConvert.DeserializeObject<ResponseSpei>(responseBody);
                    }
                }
            }
        }

        /*public bool ExecuteProcess(SendSpeiMail sendSpeiMail)
        {
            try
            {
                var contacts = this._ContactRetrieveService.Where(p => p.Enabled == true).ToList();
                var accredited = this._AccreditedRetrieveService.Find(sendSpeiMail.Accredited_Id);
                var configurations = this._ConfigurationRetrieveService.Where(p => p.Enabled == true).ToList();
                //var docHtml = this._DocumentUserProcessService.ExecuteProcess<DocumentAccredited, MemoryStream>(new DocumentAccredited()
                //{
                //    Accredited = sendSpeiMail.Accredited,
                //    Advance = sendSpeiMail.Advance
                //});

                var cartaMandato = this._AcreditedCartaMandato.Where(c => c.Accredited_Id == accredited.id).FirstOrDefault();

                if (cartaMandato is null)
                {
                    this._AcreditedCartaMandatoWrite.Create(new AcreditedCartaMandato { Accredited_Id = accredited.id, Path_Contract = "", created_at = DateTime.Now, updated_at = DateTime.Now });
                    cartaMandato = this._AcreditedCartaMandato.Where(c => c.Accredited_Id == accredited.id).FirstOrDefault();
                }

                var contractMutuo = this._AccreditedContractMutuo.Where(c => c.Accredited_Id == accredited.id).FirstOrDefault();

                if (contractMutuo is null)
                {
                    this._AccreditedContractMutuoWrite.Create(new AccreditedContractMutuo { Accredited_Id = accredited.id, Path_Contract = "", created_at = DateTime.Now, updated_at = DateTime.Now });
                    contractMutuo = this._AccreditedContractMutuo.Where(c => c.Accredited_Id == accredited.id).FirstOrDefault();
                }

                string html = this._DocumentUserProcessService.ExecuteProcess<CartaMandato, string>(new CartaMandato { accredited = accredited, advance = sendSpeiMail.Advance, acreditedCartaMandato = cartaMandato, contractMutuo = contractMutuo });

                var mailConf = configurations.FirstOrDefault(p => p.Configuration_Name == "EMAIL_CONFIG");
                var messageConfig = configurations.FirstOrDefault(p => p.Configuration_Name == "MAI_ADVANCE");

                var messageMail = JsonConvert.DeserializeObject<TemplateNetCore.Model.Dto.Input.MessageMail>(messageConfig.Configuration_Value);

                string textHtml = File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), messageMail.Message));
                textHtml = textHtml.Replace("{NAME}", accredited.First_Name);
                textHtml = textHtml.Replace("{AMOUNT}", sendSpeiMail.Amount.ToString("C2"));
                textHtml = textHtml.Replace("{WHATSAPP}", contacts.Find(p => p.id == 1).Contact_Data);
                textHtml = textHtml.Replace("{MAIL_SOPORTE}", contacts.Find(p => p.id == 2).Contact_Data);
                textHtml = textHtml.Replace("{PHONE}", contacts.Find(p => p.id == 3).Contact_Data);
                messageMail.Message = textHtml;

                var memoryStream = new MemoryStream();
                using (var pdfWriter = new PdfWriter(memoryStream))
                {
                    pdfWriter.SetCloseStream(false);
                    using (var document = HtmlConverter.ConvertToDocument(html, pdfWriter))
                    {
                    }

                }

                memoryStream.Position = 0;

                using (FileStream fs = new FileStream(Path.Combine(Directory.GetCurrentDirectory(), accredited.Contract_number + DateTime.Now.ToString("yyyy-mm-dd") + ".pdf"), FileMode.OpenOrCreate))
                {
                    memoryStream.CopyTo(fs);
                    fs.Flush();

                    cartaMandato.Path_Contract = $"{configurations.Find(p => p.Configuration_Name == "URL_APP").Configuration_Value}{accredited.Contract_number}{DateTime.Now:yyyy-mm-dd}.pdf";
                    this._AcreditedCartaMandatoWrite.Update(cartaMandato);
                }

                memoryStream.Position = 0;

                FileMail fileMil = new FileMail()
                {
                    FileName = configurations.FirstOrDefault(p => p.Configuration_Name == "CONTRACT_ACCREDITED_NAME").Configuration_Value,
                    File = memoryStream
                };

                Utilities.SendEmail(new List<string> { accredited.Mail_Mandate_Latter, accredited.Mail }, messageMail, mailConf, fileMil);


                return true;
            }
            catch (Exception exception)
            {
                //throw new SystemValidationException($"Error update Spei: {exception}");
                return false;
            }
        }*/
    }
}
