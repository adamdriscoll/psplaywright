using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Add, "PlaywrightPageExposeFunction")]
    public class ExposeFunctionPageCommand : PlaywrightCmdletBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string Name { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        public ScriptBlock Callback { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.ExposeFunctionAsync(Name, arg => Callback.InvokeReturnAsIs(arg)).GetAwaiter().GetResult();
        }
    }
}
