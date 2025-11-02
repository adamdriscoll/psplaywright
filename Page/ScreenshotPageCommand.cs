using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageScreenshot")]
    public class ScreenshotPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

        [Parameter(Position = 1)]
        public string? Path { get; set; }

        protected override void ProcessRecord()
        {
            if (!string.IsNullOrEmpty(Path))
            {
                if (Page != null && Path != null)
                {
                    Nito.AsyncEx.AsyncContext.Run(() => Page.ScreenshotAsync(new PageScreenshotOptions { Path = Path }));
                }
            }
            else
            {
                if (Page != null)
                {
                    Nito.AsyncEx.AsyncContext.Run(() => Page.ScreenshotAsync());
                }
            }
        }
    }
}
