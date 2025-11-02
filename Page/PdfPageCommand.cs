using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright.PageCommands
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPagePdf")]
    public class PdfPageCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

        [Parameter(Position = 1)]
        public string? Path { get; set; }

        protected override void ProcessRecord()
        {
            if (Page != null)
            {
                if (!string.IsNullOrEmpty(Path))
                {
                    Nito.AsyncEx.AsyncContext.Run(() => Page.PdfAsync(new PagePdfOptions { Path = Path }));
                }
                else
                {
                    Nito.AsyncEx.AsyncContext.Run(() => Page.PdfAsync());
                }
            }
            else
            {
                ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
            }
        }
    }
}
