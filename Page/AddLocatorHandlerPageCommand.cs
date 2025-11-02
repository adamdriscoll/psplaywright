using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
        [Cmdlet(VerbsCommon.Add, "PlaywrightPageLocatorHandler")]
        public class AddLocatorHandlerPageCommand : PSCmdlet
    {

            [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

            [Parameter(Mandatory = true, Position = 1)]
        public ILocator? Locator { get; set; }

            [Parameter(Mandatory = true, Position = 2)]
        public ScriptBlock? Handler { get; set; }

            protected override void ProcessRecord()
            {
                if (Page == null)
                {
                    ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
                }
                Page!.AddLocatorHandlerAsync(Locator!, async loc => { Handler!.InvokeReturnAsIs(loc); }).GetAwaiter().GetResult();
            }
    }
}
