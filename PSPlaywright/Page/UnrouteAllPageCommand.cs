using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Unregister, "PlaywrightPageRoute", DefaultParameterSetName = "All")]
    public class UnrouteAllPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "ByPattern")]
        public string? UrlPattern { get; set; }

        protected override void ProcessRecord()
        {
            if (this.ParameterSetName == "ByPattern")
            {
                GetPageInstance().UnrouteAsync(UrlPattern!).GetAwaiter().GetResult();
                return;
            }

            GetPageInstance().UnrouteAllAsync().GetAwaiter().GetResult();
        }
    }
}
