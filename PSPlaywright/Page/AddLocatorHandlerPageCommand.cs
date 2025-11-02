using System.Management.Automation;
using Microsoft.Playwright;
using Nito.AsyncEx;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Add, "PlaywrightPageLocatorHandler")]
    public class AddLocatorHandlerPageCommand : PageCommandBase
    {

        [Parameter(Mandatory = true, Position = 1)]
        public ILocator? Locator { get; set; }

        [Parameter(Mandatory = true, Position = 2)]
        public ScriptBlock? Handler { get; set; }

            protected override void ProcessRecord()
            {
                var page = GetPageInstance();
                page.AddLocatorHandlerAsync(Locator!, async loc => { 
                    Handler!.InvokeReturnAsIs(loc); 
                }).GetAwaiter().GetResult();
            }
    }
}
