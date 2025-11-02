using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageTitle")]
    public class TitlePageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            var title = page != null ? Nito.AsyncEx.AsyncContext.Run(() => page.TitleAsync()) : null;
            WriteObject(title);
        }
    }
}
