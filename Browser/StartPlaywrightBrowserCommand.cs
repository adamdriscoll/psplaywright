using System.Management.Automation;
using Microsoft.Playwright;
using Nito.AsyncEx;

namespace psplaywright;

[Cmdlet(VerbsLifecycle.Start, "PlaywrightBrowser")]
public class StartPlaywrightBrowserCommand : PlaywrightCmdletBase
{
    [Parameter(Mandatory = true)]
    [ValidateSet("chromium", "firefox", "webkit")]
    public string BrowserType { get; set; } = "chromium";

    [Parameter]
    public SwitchParameter Headless { get; set; }

    protected override void ProcessRecord()
    {
        var playwright = GetPlaywrightInstance();

        IBrowser? browser = null;
        switch (BrowserType.ToLowerInvariant())
        {
            case "chromium":
                browser = AsyncContext.Run(() => playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions { Headless = Headless.IsPresent }));
                break;
            case "firefox":
                browser = AsyncContext.Run(() => playwright.Firefox.LaunchAsync(new BrowserTypeLaunchOptions { Headless = Headless.IsPresent }));
                break;
            case "webkit":
                browser = AsyncContext.Run(() => playwright.Webkit.LaunchAsync(new BrowserTypeLaunchOptions { Headless = Headless.IsPresent }));
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
