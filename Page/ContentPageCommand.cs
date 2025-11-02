using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageContent")]
    public class ContentPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            var content = Nito.AsyncEx.AsyncContext.Run(() => page.ContentAsync());
            WriteObject(content);
        }
    }
}
