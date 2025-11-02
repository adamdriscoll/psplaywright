using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageRouteWebSocket")]
    public class RouteWebSocketPageCommand : PlaywrightCmdletBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string UrlPattern { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public ScriptBlock Handler { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.RouteWebSocketAsync(UrlPattern, wsRoute => Handler.InvokeReturnAsIs(wsRoute)).GetAwaiter().GetResult();
        }
    }
}
