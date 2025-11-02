using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Add, "PlaywrightPageExposeBinding")]
    public class ExposeBindingPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string Name { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public ScriptBlock Callback { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.ExposeBindingAsync(Name, (source, args) => Callback.InvokeReturnAsIs(source)).GetAwaiter().GetResult();
        }
    }
}
