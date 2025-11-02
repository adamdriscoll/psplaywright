using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPagePdf")]
    public class PdfPageCommand : PageCommandBase
    {
        [Parameter(Position = 0, Mandatory = true)]
        public string? Path { get; set; }

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            Nito.AsyncEx.AsyncContext.Run(() => page.PdfAsync(new PagePdfOptions { Path = Path }));
        }
    }
}
