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
            var title = Nito.AsyncEx.AsyncContext.Run(() => page.TitleAsync());
            WriteObject(title);
        }
    }
}
