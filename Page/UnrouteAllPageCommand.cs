using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Remove, "PlaywrightPageAllRoutes")]
    public class UnrouteAllPageCommand : PlaywrightCmdletBase
    {
        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.UnrouteAllAsync().GetAwaiter().GetResult();
        }
    }
}
