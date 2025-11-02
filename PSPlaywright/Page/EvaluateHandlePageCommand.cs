using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Get, "PlaywrightPageEvaluateHandle")]
    public class EvaluateHandlePageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string Expression { get; set; } = string.Empty;

        [Parameter(Position = 1)]
        public object? Argument { get; set; }

        protected override void ProcessRecord()
        {
            var handle = GetPageInstance().EvaluateHandleAsync(Expression, Argument).GetAwaiter().GetResult();
            WriteObject(handle);
        }
    }
}
