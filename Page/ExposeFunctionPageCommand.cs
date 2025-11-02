using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Add, "PlaywrightPageExposeFunction")]
    public class ExposeFunctionPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string Name { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public ScriptBlock Callback { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            //TODO: Page.ExposeFunctionAsync(Name, arg => Callback.InvokeReturnAsIs(arg)).GetAwaiter().GetResult();
        }
    }
}
