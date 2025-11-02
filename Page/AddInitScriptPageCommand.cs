using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
        [Cmdlet(VerbsCommon.Add, "PlaywrightPageInitScript")]
        public class AddInitScriptPageCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage Page { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public string Script { get; set; }

        protected override void ProcessRecord()
        {
            if (Page == null)
            {
                ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
            }
            Page.AddInitScriptAsync(Script).GetAwaiter().GetResult();
        }
    }
}
