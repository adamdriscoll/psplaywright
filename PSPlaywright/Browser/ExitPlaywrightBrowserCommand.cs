using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Exit, "PlaywrightBrowser")]
    public class ExitPlaywrightBrowserCommand : BrowserCommandBase
    {
        protected override void ProcessRecord()
        {
            var context = GetPlaywrightContext();
            context.ExitBrowser(); // Pops the browser from the stack, does not close it
        }
    }
}
