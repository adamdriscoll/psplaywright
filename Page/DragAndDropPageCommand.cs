using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageDragAndDrop")]
    public class DragAndDropPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 1)]
        public string? SourceSelector { get; set; }

        [Parameter(Mandatory = true, Position = 2)]
        public string? TargetSelector { get; set; }

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            page.DragAndDropAsync(SourceSelector!, TargetSelector!).GetAwaiter().GetResult();
        }
    }
}
