using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Invoke, "PlaywrightPageRequest")]
    public class RouteFromHARPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string? HarPath { get; set; }

        protected override void ProcessRecord()
        {
            GetPageInstance().RouteFromHARAsync(HarPath!).GetAwaiter().GetResult();
        }
    }
}
