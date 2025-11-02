using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright;

[Cmdlet(VerbsCommon.Open, "PlaywrightPage")]
public class OpenPlaywrightPageCommand : BrowserCommandBase
{
    [Parameter]
    public string Url { get; set; } = string.Empty;

    protected override void ProcessRecord()
    {
        IPage page = Nito.AsyncEx.AsyncContext.Run(() => GetBrowserInstance().NewPageAsync());
        if (!string.IsNullOrWhiteSpace(Url))
        {
            Nito.AsyncEx.AsyncContext.Run(() => page.GotoAsync(Url));
        }
        WriteObject(page);
    }
}
