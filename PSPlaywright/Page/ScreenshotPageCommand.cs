using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageScreenshot")]
    public class ScreenshotPageCommand : PageCommandBase
    {
        [Parameter(Position = 1)]
        public string? Path { get; set; }

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            if (!string.IsNullOrEmpty(Path))
            {
                if (page != null && Path != null)
                {
                    Nito.AsyncEx.AsyncContext.Run(() => page.ScreenshotAsync(new PageScreenshotOptions { Path = Path }));
                }
            }
            else
            {
                if (page != null)
                {
                    Nito.AsyncEx.AsyncContext.Run(() => page.ScreenshotAsync());
                }
            }
        }
    }
}
