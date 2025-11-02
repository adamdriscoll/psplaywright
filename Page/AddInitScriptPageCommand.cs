using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Add, "PlaywrightPageInitScript")]
    public class AddInitScriptPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 1)]
        public string Script { get; set; } = string.Empty;

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            page.AddInitScriptAsync(Script).GetAwaiter().GetResult();
        }
    }
}
