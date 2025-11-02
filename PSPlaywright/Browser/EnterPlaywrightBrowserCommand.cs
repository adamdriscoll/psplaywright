using System.Management.Automation;

using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Enter, "PlaywrightBrowser")]
    public class EnterPlaywrightBrowserCommand : PlaywrightContextCommand
    {
        [Parameter(Mandatory = true, Position = 0, ValueFromPipeline = true)]
        public IBrowser Browser { get; set; } = null!;

        protected override void ProcessRecord()
        {
            var context = GetPlaywrightContext();
            context.EnterBrowser(Browser);
        }
    }
}
