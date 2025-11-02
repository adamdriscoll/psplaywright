using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageViewportSize")]
    public class SetViewportSizePageCommand : PlaywrightCmdletBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public int Width { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public int Height { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.SetViewportSizeAsync(Width, Height).GetAwaiter().GetResult();
        }
    }
}
