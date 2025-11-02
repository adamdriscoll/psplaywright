using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Close, "PlaywrightPage")]
    public class ClosePageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            Nito.AsyncEx.AsyncContext.Run(() => page.CloseAsync());
        }
    }
}
