using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageRouteFromHAR")]
    public class RouteFromHARPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string HarPath { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.RouteFromHARAsync(HarPath).GetAwaiter().GetResult();
        }
    }
}
