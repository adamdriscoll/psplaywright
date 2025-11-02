using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Remove, "PlaywrightPageAllRoutes")]
    public class UnrouteAllPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.UnrouteAllAsync().GetAwaiter().GetResult();
        }
    }
}
