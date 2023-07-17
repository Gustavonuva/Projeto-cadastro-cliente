using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FormConsultarCep.Startup))]
namespace FormConsultarCep
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
