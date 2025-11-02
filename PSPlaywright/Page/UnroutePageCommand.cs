using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Remove, "PlaywrightPageRoute")]
    public class UnroutePageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string? UrlPattern { get; set; }

        protected override void ProcessRecord()
        {
            GetPageInstance().UnrouteAsync(UrlPattern!).GetAwaiter().GetResult();
        }
    }
}
