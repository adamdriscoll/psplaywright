using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPagePdf")]
    public class PdfPageCommand : PageCommandBase
    {
        [Parameter(Position = 1)]
        public string? Path { get; set; }

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            if (page != null)
            {
                if (!string.IsNullOrEmpty(Path))
                {
                    Nito.AsyncEx.AsyncContext.Run(() => page.PdfAsync(new PagePdfOptions { Path = Path }));
                }
                else
                {
                    Nito.AsyncEx.AsyncContext.Run(() => page.PdfAsync());
                }
            }
            else
            {
                ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("page"), "PageNull", ErrorCategory.InvalidArgument, null));
            }
        }
    }
}
