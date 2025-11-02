using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageGoForward")]
    public class GoForwardPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            page.GoForwardAsync().GetAwaiter().GetResult();
        }
    }
}
