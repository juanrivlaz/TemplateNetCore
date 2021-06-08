using System.Text.Json.Serialization;
using System.Xml.Serialization;

namespace TemplateNetCore.Model.Spei
{
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.7.3190.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace = "http://h2h.integration.spei.enlacefi.lgec.com/")]
    public partial class ordenPagoWS : object, System.ComponentModel.INotifyPropertyChanged
    {

        private int causaDevolucionField;

        private bool causaDevolucionFieldSpecified;

        private string claveCatUsuario1Field;

        private string claveCatUsuario2Field;

        private string clavePagoField;

        private string claveRastreoField;

        private string claveRastreoDevolucionField;

        private string conceptoPagoField;

        private string conceptoPago2Field;

        private string cuentaBeneficiarioField;

        private string cuentaBeneficiario2Field;

        private string cuentaOrdenanteField;

        private int digitoIdentificadorBeneficiarioField;

        private bool digitoIdentificadorBeneficiarioFieldSpecified;

        private int digitoIdentificadorOrdenanteField;

        private bool digitoIdentificadorOrdenanteFieldSpecified;

        private string emailBeneficiarioField;

        private string empresaField;

        private string errorField;

        private string estadoField;

        private facturaWS[] facturasField;

        private string fechaLimitePagoField;

        private int fechaOperacionField;

        private bool fechaOperacionFieldSpecified;

        private string firmaField;

        private string folioOrigenField;

        private string folioPlataformaField;

        private string idClienteField;

        private int idEFField;

        private bool idEFFieldSpecified;

        private int institucionContraparteField;

        private bool institucionContraparteFieldSpecified;

        private int institucionOperanteField;

        private bool institucionOperanteFieldSpecified;

        private decimal ivaField;

        private bool ivaFieldSpecified;

        private int medioEntregaField;

        private bool medioEntregaFieldSpecified;

        private decimal montoField;

        private bool montoFieldSpecified;

        private decimal montoComisionField;

        private bool montoComisionFieldSpecified;

        private decimal montoInteresField;

        private bool montoInteresFieldSpecified;

        private decimal montoOriginalField;

        private bool montoOriginalFieldSpecified;

        private string nombreBeneficiarioField;

        private string nombreBeneficiario2Field;

        private string nombreCEPField;

        private string nombreOrdenanteField;

        private string numCelularBeneficiarioField;

        private string numCelularOrdenanteField;

        private int pagoComisionField;

        private bool pagoComisionFieldSpecified;

        private int prioridadField;

        private bool prioridadFieldSpecified;

        private string referenciaCobranzaField;

        private int referenciaNumericaField;

        private bool referenciaNumericaFieldSpecified;

        private int reintentosField;

        private bool reintentosFieldSpecified;

        private string rfcCEPField;

        private string rfcCurpBeneficiarioField;

        private string rfcCurpBeneficiario2Field;

        private string rfcCurpOrdenanteField;

        private string selloField;

        private string serieCertificadoField;

        private string swift1Field;

        private string swift2Field;

        private int tipoCuentaBeneficiarioField;

        private bool tipoCuentaBeneficiarioFieldSpecified;

        private int tipoCuentaBeneficiario2Field;

        private bool tipoCuentaBeneficiario2FieldSpecified;

        private int tipoCuentaOrdenanteField;

        private bool tipoCuentaOrdenanteFieldSpecified;

        private int tipoOperacionField;

        private bool tipoOperacionFieldSpecified;

        private int tipoPagoField;

        private bool tipoPagoFieldSpecified;

        private string topologiaField;

        private long tsAcuseBanxicoField;

        private bool tsAcuseBanxicoFieldSpecified;

        private long tsAcuseConfirmacionField;

        private bool tsAcuseConfirmacionFieldSpecified;

        private long tsCapturaField;

        private bool tsCapturaFieldSpecified;

        private long tsConfirmacionField;

        private bool tsConfirmacionFieldSpecified;

        private long tsDevolucionField;

        private bool tsDevolucionFieldSpecified;

        private long tsDevolucionRecibidaField;

        private bool tsDevolucionRecibidaFieldSpecified;

        private long tsEntregaField;

        private bool tsEntregaFieldSpecified;

        private long tsLiquidacionField;

        private bool tsLiquidacionFieldSpecified;

        private string uetrField;

        private string usuarioField;

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 0)]
        public string claveRastreo
        {
            get
            {
                return this.claveRastreoField;
            }
            set
            {
                this.claveRastreoField = value;
                this.RaisePropertyChanged("claveRastreo");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 1)]
        public string conceptoPago
        {
            get
            {
                return this.conceptoPagoField;
            }
            set
            {
                this.conceptoPagoField = value;
                this.RaisePropertyChanged("conceptoPago");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 2)]
        public string cuentaBeneficiario
        {
            get
            {
                return this.cuentaBeneficiarioField;
            }
            set
            {
                this.cuentaBeneficiarioField = value;
                this.RaisePropertyChanged("cuentaBeneficiario");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 3)]
        public string cuentaOrdenante
        {
            get
            {
                return this.cuentaOrdenanteField;
            }
            set
            {
                this.cuentaOrdenanteField = value;
                this.RaisePropertyChanged("cuentaOrdenante");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 4)]
        public string empresa
        {
            get
            {
                return this.empresaField;
            }
            set
            {
                this.empresaField = value;
                this.RaisePropertyChanged("empresa");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 5)]
        public int fechaOperacion
        {
            get
            {
                return this.fechaOperacionField;
            }
            set
            {
                this.fechaOperacionField = value;
                this.RaisePropertyChanged("fechaOperacion");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 6)]
        public string firma
        {
            get
            {
                return this.firmaField;
            }
            set
            {
                this.firmaField = value;
                this.RaisePropertyChanged("firma");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 7)]
        public string folioOrigen
        {
            get
            {
                return this.folioOrigenField;
            }
            set
            {
                this.folioOrigenField = value;
                this.RaisePropertyChanged("folioOrigen");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 8)]
        public int institucionContraparte
        {
            get
            {
                return this.institucionContraparteField;
            }
            set
            {
                this.institucionContraparteField = value;
                this.RaisePropertyChanged("institucionContraparte");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 9)]
        public int institucionOperante
        {
            get
            {
                return this.institucionOperanteField;
            }
            set
            {
                this.institucionOperanteField = value;
                this.RaisePropertyChanged("institucionOperante");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 10)]
        public decimal monto
        {
            get
            {
                return this.montoField;
            }
            set
            {
                this.montoField = value;
                this.RaisePropertyChanged("monto");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 11)]
        public string nombreBeneficiario
        {
            get
            {
                return this.nombreBeneficiarioField;
            }
            set
            {
                this.nombreBeneficiarioField = value;
                this.RaisePropertyChanged("nombreBeneficiario");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 12)]
        public string nombreOrdenante
        {
            get
            {
                return this.nombreOrdenanteField;
            }
            set
            {
                this.nombreOrdenanteField = value;
                this.RaisePropertyChanged("nombreOrdenante");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 13)]
        public int referenciaNumerica
        {
            get
            {
                return this.referenciaNumericaField;
            }
            set
            {
                this.referenciaNumericaField = value;
                this.RaisePropertyChanged("referenciaNumerica");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 14)]
        public string rfcCurpBeneficiario
        {
            get
            {
                return this.rfcCurpBeneficiarioField;
            }
            set
            {
                this.rfcCurpBeneficiarioField = value;
                this.RaisePropertyChanged("rfcCurpBeneficiario");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 15)]
        public string rfcCurpOrdenante
        {
            get
            {
                return this.rfcCurpOrdenanteField;
            }
            set
            {
                this.rfcCurpOrdenanteField = value;
                this.RaisePropertyChanged("rfcCurpOrdenante");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 16)]
        public int tipoCuentaBeneficiario
        {
            get
            {
                return this.tipoCuentaBeneficiarioField;
            }
            set
            {
                this.tipoCuentaBeneficiarioField = value;
                this.RaisePropertyChanged("tipoCuentaBeneficiario");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 17)]
        public int tipoCuentaOrdenante
        {
            get
            {
                return this.tipoCuentaOrdenanteField;
            }
            set
            {
                this.tipoCuentaOrdenanteField = value;
                this.RaisePropertyChanged("tipoCuentaOrdenante");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 18)]
        public int tipoPago
        {
            get
            {
                return this.tipoPagoField;
            }
            set
            {
                this.tipoPagoField = value;
                this.RaisePropertyChanged("tipoPago");
            }
        }
        
        
        
        
        
        
        
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 19)]
        public string emailBeneficiario
        {
            get
            {
                return this.emailBeneficiarioField;
            }
            set
            {
                this.emailBeneficiarioField = value;
                this.RaisePropertyChanged("emailBeneficiario");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 20)]
        public int tipoCuentaBeneficiario2
        {
            get
            {
                return this.tipoCuentaBeneficiario2Field;
            }
            set
            {
                this.tipoCuentaBeneficiario2Field = value;
                this.RaisePropertyChanged("tipoCuentaBeneficiario2");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 21)]
        public string nombreBeneficiario2
        {
            get
            {
                return this.nombreBeneficiario2Field;
            }
            set
            {
                this.nombreBeneficiario2Field = value;
                this.RaisePropertyChanged("nombreBeneficiario2");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 22)]
        public string cuentaBeneficiario2
        {
            get
            {
                return this.cuentaBeneficiario2Field;
            }
            set
            {
                this.cuentaBeneficiario2Field = value;
                this.RaisePropertyChanged("cuentaBeneficiario2");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 23)]
        public string rfcCurpBeneficiario2
        {
            get
            {
                return this.rfcCurpBeneficiario2Field;
            }
            set
            {
                this.rfcCurpBeneficiario2Field = value;
                this.RaisePropertyChanged("rfcCurpBeneficiario2");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 24)]
        public string conceptoPago2
        {
            get
            {
                return this.conceptoPago2Field;
            }
            set
            {
                this.conceptoPago2Field = value;
                this.RaisePropertyChanged("conceptoPago2");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 25)]
        public string claveCatUsuario1
        {
            get
            {
                return this.claveCatUsuario1Field;
            }
            set
            {
                this.claveCatUsuario1Field = value;
                this.RaisePropertyChanged("claveCatUsuario1");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 26)]
        public string claveCatUsuario2
        {
            get
            {
                return this.claveCatUsuario2Field;
            }
            set
            {
                this.claveCatUsuario2Field = value;
                this.RaisePropertyChanged("claveCatUsuario2");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 27)]
        public string clavePago
        {
            get
            {
                return this.clavePagoField;
            }
            set
            {
                this.clavePagoField = value;
                this.RaisePropertyChanged("clavePago");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 28)]
        public string referenciaCobranza
        {
            get
            {
                return this.referenciaCobranzaField;
            }
            set
            {
                this.referenciaCobranzaField = value;
                this.RaisePropertyChanged("referenciaCobranza");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 29)]
        public int tipoOperacion
        {
            get
            {
                return this.tipoOperacionField;
            }
            set
            {
                this.tipoOperacionField = value;
                this.RaisePropertyChanged("tipoOperacion");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 30)]
        public string topologia
        {
            get
            {
                return this.topologiaField;
            }
            set
            {
                this.topologiaField = value;
                this.RaisePropertyChanged("topologia");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 31)]
        public string usuario
        {
            get
            {
                return this.usuarioField;
            }
            set
            {
                this.usuarioField = value;
                this.RaisePropertyChanged("usuario");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 32)]
        public int medioEntrega
        {
            get
            {
                return this.medioEntregaField;
            }
            set
            {
                this.medioEntregaField = value;
                this.RaisePropertyChanged("medioEntrega");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 33)]
        public int prioridad
        {
            get
            {
                return this.prioridadField;
            }
            set
            {
                this.prioridadField = value;
                this.RaisePropertyChanged("prioridad");
            }
        }
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form = System.Xml.Schema.XmlSchemaForm.Unqualified, Order = 34)]
        public decimal iva
        {
            get
            {
                return this.ivaField;
            }
            set
            {
                this.ivaField = value;
                this.RaisePropertyChanged("iva");
            }
        }
        

        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;

        protected void RaisePropertyChanged(string propertyName)
        {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null))
            {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
