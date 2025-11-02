using System.Management.Automation;
using Microsoft.Playwright;
using System.Collections.Generic;

namespace psplaywright
{
        [Cmdlet(VerbsCommon.Get, "PlaywrightPageErrors")]
    public class PageErrorsPageCommand : PageCommandBase
    {
            protected override void ProcessRecord()
            {
                var page = GetPageInstance();
                if (page == null)
                {
                    ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("page"), "PageNull", ErrorCategory.InvalidArgument, null));
                }
                // PageErrorsAsync does not exist on IPage, so this method may need to be implemented or removed. For now, just throw not implemented.
                throw new System.NotImplementedException("PageErrorsAsync is not available on IPage.");
            }
    }
}
