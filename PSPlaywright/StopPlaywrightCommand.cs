
using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Stop, "Playwright")]
    [OutputType(typeof(void))]
    public class StopPlaywrightCommand : PlaywrightContextCommand
    {
        protected override void ProcessRecord()
        {
            var playwrightContext = GetPlaywrightContext();
            if (playwrightContext != null)
            {
                playwrightContext.Dispose();
                return;
            }

            ThrowTerminatingError(new ErrorRecord(
                new InvalidOperationException("No Playwright object specified and no global PlaywrightInstance found to stop."),
                "PlaywrightNotFound",
                ErrorCategory.ObjectNotFound,
                null));
        }
    }
}

