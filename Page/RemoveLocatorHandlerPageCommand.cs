using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Remove, "PlaywrightPageLocatorHandler")]
    public class RemoveLocatorHandlerPageCommand : PlaywrightCmdletBase
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
