using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Register, "PlaywrightPageRouteHandler")]
    public class RoutePageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string? UrlPattern { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public ScriptBlock? Handler { get; set; }

        [Parameter()]
        [ValidateSet("Http", "WebSocket")]
        public string Type { get; set; } = "Http";

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            if (Type == "WebSocket")
            {
                page.RouteWebSocketAsync(UrlPattern!, wsRoute => Handler!.InvokeReturnAsIs(wsRoute)).GetAwaiter().GetResult();
                return;
            }

            page.RouteAsync(UrlPattern!, route => Handler!.InvokeReturnAsIs(route)).GetAwaiter().GetResult();
        }
    }
}
