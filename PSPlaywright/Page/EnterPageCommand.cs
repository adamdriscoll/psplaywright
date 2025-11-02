using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Enter, "PlaywrightPage")]
    public class EnterPageCommand : PlaywrightContextCommand
    {
        [Parameter(Mandatory = true, Position = 0, ValueFromPipeline = true)]
        public IPage Page { get; set; } = null!;

        protected override void ProcessRecord()
        {
            var context = GetPlaywrightContext();
            context.EnterPage(Page);
            WriteObject(Page);
        }
    }
}
