using System.Management.Automation;
using Microsoft.Playwright;
using System.Collections.Generic;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageRequests")]
    public class RequestsPageCommand : PlaywrightCmdletBase
    {
        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            var requests = Page.RequestsAsync().GetAwaiter().GetResult();
            WriteObject(requests, true);
        }
    }
}
