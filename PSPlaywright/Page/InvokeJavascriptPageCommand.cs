using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Invoke, "PlaywrightPageJavascript")]
    public class InvokeJavascriptPageCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string Expression { get; set; } = string.Empty;

        [Parameter(Position = 1)]
        public object? Argument { get; set; }

        protected override void ProcessRecord()
        {
            var result = GetPageInstance().EvaluateAsync<object>(Expression, Argument).GetAwaiter().GetResult();
            WriteObject(result);
        }
    }
}
