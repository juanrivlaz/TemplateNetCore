using InsiscoCore.Base.Data;
using InsiscoCore.Service;
using MoreLinq;
using Newtonsoft.Json;
using OpenXmlPowerTools;
using TemplateNetCore.Model;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Text;

namespace TemplateNetCore.Service.RetrieveServices
{
    public class NotificationRetrieveService : RetrieveService<Notification>
    {
        public NotificationRetrieveService(
            IRetrieveRepository<Notification> repository
            ) : base(repository)
        {
        }

        public override IEnumerable<Notification> Where(Func<Notification, bool> predicate)
        {

            var notifications = this._Repository.Where(predicate).ToList();

            notifications.ForEach(p =>
            {
                if (!string.IsNullOrEmpty(p.Data_Text))
                {
                    p.Data = JsonConvert.DeserializeObject(p.Data_Text);
                    p.Data_Text = string.Empty;
                }
            });



            return notifications;
        }
    }
}
