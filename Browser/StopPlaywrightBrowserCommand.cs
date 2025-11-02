using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Stop, "PlaywrightBrowser", SupportsShouldProcess = true)]
    [OutputType(typeof(void))]
    public class StopPlaywrightBrowserCommand : PSCmdlet
    {
        [Parameter(
            Mandatory = true,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            Position = 0
        )]
    public IBrowser? Browser { get; set; }

        protected override void ProcessRecord()
        {
            if (Browser != null)
            {
                Nito.AsyncEx.AsyncContext.Run(() => Browser.CloseAsync());
            }
        }
    }
}
