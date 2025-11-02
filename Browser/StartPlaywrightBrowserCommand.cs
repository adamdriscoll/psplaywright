using System.Management.Automation;
using Microsoft.Playwright;
using Nito.AsyncEx;

namespace psplaywright;

[Cmdlet(VerbsLifecycle.Start, "PlaywrightBrowser")]
public class StartPlaywrightBrowserCommand : PlaywrightContextCommand
{
    [Parameter(Mandatory = true)]
    [ValidateSet("chromium", "firefox", "webkit")]
    public string BrowserType { get; set; } = "chromium";

    [Parameter]
    public SwitchParameter Headless { get; set; }

    protected override void ProcessRecord()
    {
        var playwright = GetPlaywrightContext();

        if (playwright.Playwright == null)
            throw new Exception("Playwright instance not found. Call Start-Playwright first.");

        IBrowser? browser = null;
        switch (BrowserType.ToLowerInvariant())
        {
            case "chromium":
                browser = AsyncContext.Run(() => playwright.Playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions { Headless = Headless.IsPresent }));
                break;
            case "firefox":
                browser = AsyncContext.Run(() => playwright.Playwright.Firefox.LaunchAsync(new BrowserTypeLaunchOptions { Headless = Headless.IsPresent }));
                break;
            case "webkit":
                browser = AsyncContext.Run(() => playwright.Playwright.Webkit.LaunchAsync(new BrowserTypeLaunchOptions { Headless = Headless.IsPresent }));
                break;
            default:
                ThrowTerminatingError(new ErrorRecord(
                    new System.Exception($"Unsupported browser type: {BrowserType}"),
                    "UnsupportedBrowserType",
                    ErrorCategory.InvalidArgument,
                    BrowserType));
                return;
        }

        WriteObject(browser);
    }
}
