using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Remove, "PlaywrightPageLocatorHandler")]
    public class RemoveLocatorHandlerPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public ILocator? Locator { get; set; }

        protected override void ProcessRecord()
        {
            GetPageInstance().RemoveLocatorHandlerAsync(Locator!).GetAwaiter().GetResult();
        }
    }
}
