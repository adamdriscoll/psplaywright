using System.Management.Automation;
using Microsoft.Playwright;
using System.Collections.Generic;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageConsoleMessages")]
    public class ConsoleMessagesPageCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

        protected override void ProcessRecord()
        {
            if (Page == null)
            {
                ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
            }
            // var messages = Page.ConsoleMessagesAsync().GetAwaiter().GetResult(); // Method not found, commented out for review
            // WriteObject(messages, true);
        }
    }
}
