using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright.PageCommands
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageTitle")]
    public class TitlePageCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

        protected override void ProcessRecord()
        {
            var title = Page != null ? Nito.AsyncEx.AsyncContext.Run(() => Page.TitleAsync()) : null;
            WriteObject(title);
        }
    }
}
