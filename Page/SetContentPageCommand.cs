using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageContent")]
    public class SetContentPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string Html { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.SetContentAsync(Html).GetAwaiter().GetResult();
        }
    }
}
