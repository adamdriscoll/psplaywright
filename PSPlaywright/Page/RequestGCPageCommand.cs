using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Invoke, "PlaywrightPageGarageCollection")]
    public class RequestGCPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            GetPageInstance().RequestGCAsync().GetAwaiter().GetResult();
        }
    }
}
