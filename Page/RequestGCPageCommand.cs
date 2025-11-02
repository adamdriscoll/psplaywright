using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageRequestGC")]
    public class RequestGCPageCommand : PlaywrightCmdletBase
    {
        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.RequestGCAsync().GetAwaiter().GetResult();
        }
    }
}
