using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Invoke, "PlaywrightPageRunAndWaitForEvent")]
    public class RunAndWaitForPageEventCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage? Page { get; set; }

        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "ConsoleMessage")]
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Popup")]
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "RequestFinished")]
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Download")]
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "FileChooser")]
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "WebSocket")]
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Worker")]
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Request")]
        [Parameter(Mandatory = true, Position = 0, ParameterSetName = "Response")]
        public ScriptBlock Action { get; set; }

        [Parameter(Mandatory = true, Position = 1, ParameterSetName = "Request")]
        [Parameter(Mandatory = true, Position = 1, ParameterSetName = "Response")]
        public string UrlOrPredicate { get; set; }

        [Parameter(Mandatory = true, Position = 1, ParameterSetName = "Event")]
        public string EventType { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            switch (ParameterSetName)
            {
                case "ConsoleMessage":
                    Page.RunAndWaitForConsoleMessageAsync(() => (System.Threading.Tasks.Task)Action.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "Popup":
                    Page.RunAndWaitForPopupAsync(() => (System.Threading.Tasks.Task)Action.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "RequestFinished":
                    Page.RunAndWaitForRequestFinishedAsync(() => (System.Threading.Tasks.Task)Action.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "Download":
                    Page.RunAndWaitForDownloadAsync(() => (System.Threading.Tasks.Task)Action.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "FileChooser":
                    Page.RunAndWaitForFileChooserAsync(() => (System.Threading.Tasks.Task)Action.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "WebSocket":
                    Page.RunAndWaitForWebSocketAsync(() => (System.Threading.Tasks.Task)Action.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "Worker":
                    Page.RunAndWaitForWorkerAsync(() => (System.Threading.Tasks.Task)Action.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "Request":
                    Page.RunAndWaitForRequestAsync(() => (System.Threading.Tasks.Task)Action.InvokeReturnAsIs(), UrlOrPredicate).GetAwaiter().GetResult();
                    break;
                case "Response":
                    Page.RunAndWaitForResponseAsync(() => (System.Threading.Tasks.Task)Action.InvokeReturnAsIs(), UrlOrPredicate).GetAwaiter().GetResult();
                    break;
                default:
                    ThrowTerminatingError(new ErrorRecord(new System.ArgumentException("Unknown event type or parameter set."), "UnknownEventType", ErrorCategory.InvalidArgument, null));
                    break;
            }
        }
    }
}
