using System.Management.Automation;
using Microsoft.Playwright;
using System.Collections.Generic;

namespace psplaywright
{
        [Cmdlet(VerbsCommon.Get, "PlaywrightPageErrors")]
    public class PageErrorsPageCommand : PageCommandBase
    {
            [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

            protected override void ProcessRecord()
            {
                if (Page == null)
                {
                    ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
                }
                // PageErrorsAsync does not exist on IPage, so this method may need to be implemented or removed. For now, just throw not implemented.
                throw new System.NotImplementedException("PageErrorsAsync is not available on IPage.");
            }
    }
}
