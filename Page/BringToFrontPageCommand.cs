using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageToFront")]
    public class BringToFrontPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            page.BringToFrontAsync().GetAwaiter().GetResult();
        }
    }
}
