using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageContent")]
    public class SetContentPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string? Html { get; set; }

        protected override void ProcessRecord()
        {
            GetPageInstance().SetContentAsync(Html!).GetAwaiter().GetResult();
        }
    }
}
