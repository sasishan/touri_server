using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Owin;
using Owin;
using Microsoft.AspNet.SignalR;

[assembly: OwinStartup(typeof(Touri_Server.Startup))]

namespace Touri_Server
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);

            var hubConfiguration = new HubConfiguration();
#if DEBUG
            hubConfiguration.EnableDetailedErrors = true;
#endif
            app.MapSignalR(hubConfiguration);

            //app.MapSignalR();
        }
    }
}
