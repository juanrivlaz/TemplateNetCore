using DocumentFormat.OpenXml.Bibliography;
using DocumentFormat.OpenXml.Office2010.ExcelAc;
using InsiscoCore.Base.Service;
using InsiscoCore.Service;
using iText.Forms.Xfdf;
using Microsoft.AspNetCore.Http;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateNetCore.Model;
using TemplateNetCore.Model.Dto.Input;
using TemplateNetCore.Model.Dto.Output;
using TemplateNetCore.Model.Enum;
using TemplateNetCore.Service.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;

namespace PrestaQi.Api
{
    public class MonitoringService
    {
        static  NotificationsMessageHandler _NotificationsMessageHandler { get; set; }
        static IRetrieveService<User> _UserRetrieveService;
        static IConfiguration _Configuration;
        static System.Timers.Timer _Timer;

        static void GenerateInstances(IServiceProvider serviceProvider)
        {
            _NotificationsMessageHandler = serviceProvider.GetService<NotificationsMessageHandler>();
            _UserRetrieveService = serviceProvider.GetService<IRetrieveService<User>>();
        }

        public static void Initialize(IServiceProvider serviceProvider, IConfiguration configuration)
        {
            GenerateInstances(serviceProvider);
            _Configuration = configuration;

            _Timer = new System.Timers.Timer()
            {
                Interval = 600000,
            };

            _Timer.Elapsed += Timer_Elapsed;
            _Timer.Enabled = true;
        }

        private static void Timer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            _Timer.Enabled = false;          
            _Timer.Enabled = true;
        }

    }
}
