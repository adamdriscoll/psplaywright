using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Invoke, "PlaywrightPage")]
    public class ReloadPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
    public IPage? Page { get; set; }

        protected override void ProcessRecord()
        {
            if (Page != null)
            {
                Nito.AsyncEx.AsyncContext.Run(() => Page.ReloadAsync());
            }
            else
            {
                ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
            }
        }
    }
}
