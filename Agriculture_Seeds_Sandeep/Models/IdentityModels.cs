using System.Data.Entity;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Agriculture_Seeds_Sandeep.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit https://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("AgricultureSeedsConnection", throwIfV1Schema: false)
        {
        }

        public DbSet<AgricultureCrop> AgricultureCrops { get; set; }
        public DbSet<AgricultureCropVariety> AgricultureCropVarieties { get; set; }
        public DbSet<AgricultureCropRate> AgricultureCropRates { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<AgricultureStore> AgricultureStores { get; set; }
        public DbSet<AgricultureSeedSelling> AgricultureSeedSellings { get; set; }
        public DbSet<BankPayment> BankPayments { get; set; }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}