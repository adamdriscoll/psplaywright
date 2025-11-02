using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsLifecycle.Suspend, "PlaywrightPage")]
    public class PausePageCommand : PlaywrightCmdletBase
    {
        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.PauseAsync().GetAwaiter().GetResult();
        }
    }
}
