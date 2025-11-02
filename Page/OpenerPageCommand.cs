using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageOpener")]
    public class OpenerPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            var opener = Page.OpenerAsync().GetAwaiter().GetResult();
            WriteObject(opener);
        }
    }
}
