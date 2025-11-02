using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageEvaluate")]
    public class EvaluatePageCommand : PlaywrightCmdletBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string Expression { get; set; }

        [Parameter(Position = 1)]
        public object Argument { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            var result = Page.EvaluateAsync<object>(Expression, Argument).GetAwaiter().GetResult();
            WriteObject(result);
        }
    }
}
