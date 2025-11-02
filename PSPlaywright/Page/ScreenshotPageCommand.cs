using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageScreenshot")]
    public class ScreenshotPageCommand : PageCommandBase
    {
        [Parameter(Position = 1, Mandatory = true)]
        public string? Path { get; set; }

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            Nito.AsyncEx.AsyncContext.Run(() => page.ScreenshotAsync(new PageScreenshotOptions { Path = Path }));
        }
    }
}
