using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
        [Cmdlet(VerbsCommon.Set, "PlaywrightPageGoForward")]
    public class GoForwardPageCommand : PageCommandBase
    {
            [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

            protected override void ProcessRecord()
            {
                if (Page == null)
                {
                    ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
                }
                Page!.GoForwardAsync().GetAwaiter().GetResult();
            }
    }
}
