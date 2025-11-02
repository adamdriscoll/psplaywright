using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageRequestGC")]
    public class RequestGCPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.RequestGCAsync().GetAwaiter().GetResult();
        }
    }
}
