using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Invoke, "PlaywrightPageRunAndWaitForEvent")]
    public class RunAndWaitForPageEventCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public ScriptBlock? Action { get; set; }

        [Parameter(Mandatory = true, Position = 1)]
        [Parameter(Mandatory = true, Position = 1)]
        public string UrlOrPredicate { get; set; } = string.Empty;

        [Parameter(Mandatory = true, Position = 1)]
        [ValidateSet("ConsoleMessage", "Popup", "RequestFinished", "Download", "FileChooser", "WebSocket", "Worker", "Request", "Response")]
        public string EventType { get; set; } = string.Empty;

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            switch (EventType)
            {
                case "ConsoleMessage":
                    page.RunAndWaitForConsoleMessageAsync(() => (Task)Action!.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "Popup":
                    page.RunAndWaitForPopupAsync(() => (Task)Action!.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "RequestFinished":
                    page.RunAndWaitForRequestFinishedAsync(() => (Task)Action!.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "Download":
                    page.RunAndWaitForDownloadAsync(() => (Task)Action!.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "FileChooser":
                    page.RunAndWaitForFileChooserAsync(() => (Task)Action!.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "WebSocket":
                    page.RunAndWaitForWebSocketAsync(() => (Task)Action!.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "Worker":
                    page.RunAndWaitForWorkerAsync(() => (Task)Action!.InvokeReturnAsIs()).GetAwaiter().GetResult();
                    break;
                case "Request":
                    page.RunAndWaitForRequestAsync(() => (Task)Action!.InvokeReturnAsIs(), UrlOrPredicate).GetAwaiter().GetResult();
                    break;
                case "Response":
                    page.RunAndWaitForResponseAsync(() => (Task)Action!.InvokeReturnAsIs(), UrlOrPredicate).GetAwaiter().GetResult();
                    break;
                default:
                    ThrowTerminatingError(new ErrorRecord(new System.ArgumentException("Unknown event type or parameter set."), "UnknownEventType", ErrorCategory.InvalidArgument, null));
                    break;
            }
        }
    }
}
