using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright.PageCommands
{
    [Cmdlet(VerbsCommon.Close, "PlaywrightPage")]
    public class ClosePageCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
    public IPage? Page { get; set; }

        protected override void ProcessRecord()
        {
            if (Page != null)
            {
                Nito.AsyncEx.AsyncContext.Run(() => Page.CloseAsync());
            }
            else
            {
                ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
            }
        }
    }
}
