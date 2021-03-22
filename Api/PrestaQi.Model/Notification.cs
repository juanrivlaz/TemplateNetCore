﻿using TemplateNetCore.Model.Enum;
using TemplateNetCore.Model.General;
using System.ComponentModel.DataAnnotations.Schema;

namespace TemplateNetCore.Model
{
    [Table("notifications")]
    public partial class Notification : Entity<int>
    {
        [Column("user_id")]
        public int User_Id { get; set; }
        [Column("user_type")]
        public int User_Type { get; set; }
        [Column("title")]
        public string Title { get; set; }
        [Column("message")]
        public string Message { get; set; }
        [Column("is_read")]
        public bool Is_Read { get; set; }
        [Column("icon")]
        public string Icon { get; set; }
        [Column("data_text")]
        public string Data_Text { get; set; }
        [Column("notificationtype")]
        public TemplateNetCoreEnum.NotificationType NotificationType { get; set; }
    }
}
