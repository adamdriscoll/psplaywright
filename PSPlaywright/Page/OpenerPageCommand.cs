using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageOpener")]
    public class OpenerPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            var opener = GetPageInstance().OpenerAsync().GetAwaiter().GetResult();
            WriteObject(opener);
        }
    }
}
