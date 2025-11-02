using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Stop, "PlaywrightBrowser", SupportsShouldProcess = true)]
    [OutputType(typeof(void))]
    public class StopPlaywrightBrowserCommand : BrowserCommandBase
    {
        protected override void ProcessRecord()
        {
            var browser = GetBrowserInstance();

            if (browser != null)
            {
                Nito.AsyncEx.AsyncContext.Run(() => browser.CloseAsync());
            }
        }
    }
}
