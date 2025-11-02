using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Suspend, "PlaywrightPage")]
    public class PausePageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            GetPageInstance().PauseAsync().GetAwaiter().GetResult();
        }
    }
}
