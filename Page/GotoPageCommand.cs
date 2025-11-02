using System.Management.Automation;
namespace psplaywright
{
    [Cmdlet(VerbsCommon.Open, "PlaywrightPage")]
    public class GotoPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 1)]
        public string? Url { get; set; }

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            if (page != null && Url != null)
            {
                Nito.AsyncEx.AsyncContext.Run(() => page.GotoAsync(Url));
            }
        }
    }
}
