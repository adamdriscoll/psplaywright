using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageEvaluateHandle")]
    public class EvaluateHandlePageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string Expression { get; set; }

        [Parameter(Position = 1)]
        public object Argument { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            var handle = Page.EvaluateHandleAsync(Expression, Argument).GetAwaiter().GetResult();
            WriteObject(handle);
        }
    }
}
