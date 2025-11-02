using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
        [Cmdlet(VerbsCommon.Set, "PlaywrightPageToFront")]
    public class BringToFrontPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

        protected override void ProcessRecord()
        {
            if (Page == null)
            {
                ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
            }
            Page.BringToFrontAsync().GetAwaiter().GetResult();
        }
    }
}
