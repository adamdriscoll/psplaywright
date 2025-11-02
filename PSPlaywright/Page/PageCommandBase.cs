using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    public abstract class PageCommandBase : PlaywrightContextCommand
    {
        [Parameter(ValueFromPipeline = true)]
        public IPage? Page { get; set; }

        protected IPage GetPageInstance()
        {
            if (Page != null)
                return Page;

            var context = GetPlaywrightContext();
            if (context.Pages.Count > 0)
                return context.Pages.Peek();

            throw new Exception("Page instance not found. Please start a Page first.");
        }
    }
}
