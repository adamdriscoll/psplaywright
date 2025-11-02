using System.Management.Automation;
using Microsoft.Playwright;
using Nito.AsyncEx;
using psplaywright;

namespace psplaywright;


[Cmdlet(VerbsLifecycle.Start, "Playwright")]
public class StartPlaywrightCommand : PlaywrightContextCommand
{
    [Parameter]
    public SwitchParameter PassThru { get; set; }

    protected override void ProcessRecord()
    {
        var context = GetPlaywrightContext();
        if (context.Playwright != null)
        {
            ThrowTerminatingError(new ErrorRecord(
                new InvalidOperationException("Playwright is already started in the current context."),
                "PlaywrightAlreadyStarted",
                ErrorCategory.InvalidOperation,
                null));
            return;
        }

        var playwright = AsyncContext.Run(() => Playwright.CreateAsync());
        context.Playwright = playwright;

        if (PassThru.IsPresent)
        {
            WriteObject(playwright);
        }
    }
}
