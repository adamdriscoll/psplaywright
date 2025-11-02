using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageRoute")]
    public class RoutePageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string UrlPattern { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public ScriptBlock Handler { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.RouteAsync(UrlPattern, route => Handler.InvokeReturnAsIs(route)).GetAwaiter().GetResult();
        }
    }
}
