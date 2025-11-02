using System.Management.Automation;
using Microsoft.Playwright;
using Nito.AsyncEx;

namespace psplaywright;

[Cmdlet(VerbsCommon.Open, "PlaywrightPage")]
public class OpenPlaywrightPageCommand : PlaywrightCmdletBase
{
    [Parameter(Mandatory = true, ValueFromPipeline = true)]
    public IBrowser Browser { get; set; } = null!;

    [Parameter]
    public string? Url { get; set; }

    protected override void ProcessRecord()
    {
    IPage page = Nito.AsyncEx.AsyncContext.Run(() => Browser.NewPageAsync());
        if (!string.IsNullOrWhiteSpace(Url))
        {
            Nito.AsyncEx.AsyncContext.Run(() => page.GotoAsync(Url));
        }
        WriteObject(page);
    }
}
