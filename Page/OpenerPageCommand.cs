using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageOpener")]
    public class OpenerPageCommand : PlaywrightCmdletBase
    {
        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            var opener = Page.OpenerAsync().GetAwaiter().GetResult();
            WriteObject(opener);
        }
    }
}
