using System.Management.Automation;
using Microsoft.Playwright;
using System.Collections.Generic;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageConsoleMessages")]
    public class ConsoleMessagesPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            // var messages = page.ConsoleMessagesAsync().GetAwaiter().GetResult(); // Method not found, commented out for review
            // WriteObject(messages, true);
        }
    }
}
