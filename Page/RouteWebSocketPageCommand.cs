using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageRouteWebSocket")]
    public class RouteWebSocketPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string? UrlPattern { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public ScriptBlock? Handler { get; set; }

        protected override void ProcessRecord()
        {
            GetPageInstance().RouteWebSocketAsync(UrlPattern!, wsRoute => Handler!.InvokeReturnAsIs(wsRoute)).GetAwaiter().GetResult();
        }
    }
}
