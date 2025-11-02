using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageDragAndDrop")]
    public class DragAndDropPageCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public string? SourceSelector { get; set; }

        [Parameter(Mandatory = true, Position = 2)]
        public string? TargetSelector { get; set; }

        protected override void ProcessRecord()
        {
            if (Page == null)
            {
                ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
            }
            Page.DragAndDropAsync(SourceSelector, TargetSelector).GetAwaiter().GetResult();
        }
    }
}
