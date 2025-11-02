using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Open, "PlaywrightPage")]
    public class GotoPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public string? Url { get; set; }

        protected override void ProcessRecord()
        {
            if (Page != null && Url != null)
            {
                Nito.AsyncEx.AsyncContext.Run(() => Page.GotoAsync(Url));
            }
        }
    }
}
