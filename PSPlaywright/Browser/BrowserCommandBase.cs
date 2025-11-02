using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    public abstract class BrowserCommandBase : PlaywrightContextCommand
    {
        [Parameter(ValueFromPipeline = true)]
        public IBrowser? Browser { get; set; }

        protected IBrowser GetBrowserInstance()
        {
            if (Browser != null)
                return Browser;

            var context = GetPlaywrightContext();
            if (context.Browsers.Count > 0)
                return context.Browsers.Peek();

            throw new Exception("Browser instance not found. Please start a Browser first.");
        }
    }
}
