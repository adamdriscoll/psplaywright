using System.Management.Automation;
using Microsoft.Playwright;
using System.Collections.Generic;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageRequests")]
    public class RequestsPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            // TODO: var requests = Page.RequestsAsync().GetAwaiter().GetResult();
            // WriteObject(requests, true);
        }
    }
}
