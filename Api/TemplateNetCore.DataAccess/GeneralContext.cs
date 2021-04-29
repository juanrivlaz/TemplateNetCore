using Microsoft.EntityFrameworkCore;
using TemplateNetCore.Model;
using System.Linq;
using TemplateNetCore;

namespace TemplateNetCore.DataAccess
{
    public class GeneralContext : DbContext
    {
        public GeneralContext(DbContextOptions<GeneralContext> options) : base(options)
        {
        }
        
        public DbSet<User> Users { get; set; }
        public DbSet<SpeiResponse> SpeiResponses { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<LogError> LogErrors { get; set; }
        public DbSet<Company> Companies { get; set; }
        public DbSet<Configuration> Configurations { get; set; }
        public DbSet<Dispertion> Dispertions { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);


            foreach (var entityType in builder.Model.GetEntityTypes())
            {
                foreach (var property in entityType.GetProperties())
                {
                    var attributes = property.PropertyInfo.GetCustomAttributes(typeof(EncryptedAttribute), false);
                    if (attributes.Any())
                    {
                        property.SetField((attributes.First() as EncryptedAttribute).FieldName);
                        property.SetPropertyAccessMode(PropertyAccessMode.Field);
                    }
                }
            }
        }   
    }

}
