using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Remove, "PlaywrightPageLocatorHandler")]
    public class RemoveLocatorHandlerPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public ILocator Locator { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.RemoveLocatorHandlerAsync(Locator).GetAwaiter().GetResult();
        }
    }
}
