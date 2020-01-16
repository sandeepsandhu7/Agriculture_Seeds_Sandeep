using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Agriculture_Seeds_Sandeep.Startup))]
namespace Agriculture_Seeds_Sandeep
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
