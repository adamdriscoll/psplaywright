using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageContent")]
    public class ContentPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

        protected override void ProcessRecord()
        {
            var content = Page != null ?  Nito.AsyncEx.AsyncContext.Run(() => Page.ContentAsync()) : null;
            WriteObject(content);
        }
    }
}
