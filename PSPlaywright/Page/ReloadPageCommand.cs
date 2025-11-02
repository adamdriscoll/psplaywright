using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Reset, "PlaywrightPage")]
    public class ReloadPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            Nito.AsyncEx.AsyncContext.Run(() => page.ReloadAsync());
        }
    }
}
