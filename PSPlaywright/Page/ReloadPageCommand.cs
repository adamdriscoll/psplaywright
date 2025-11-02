using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Invoke, "PlaywrightPage")]
    public class ReloadPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            if (page != null)
            {
                Nito.AsyncEx.AsyncContext.Run(() => page.ReloadAsync());
            }
            else
            {
                ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("page"), "PageNull", ErrorCategory.InvalidArgument, null));
            }
        }
    }
}
