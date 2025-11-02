using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Wait, "PlaywrightPageEvent")]
    public class WaitForPageEventCommand : PageCommandBase
    {
        // WaitForRequest
        [Parameter(Mandatory = false)]
        public string UrlOrPredicate { get; set; } = string.Empty;

        // WaitForResponse
        [Parameter(Mandatory = false)]
        public string ResponseUrlOrPredicate { get; set; } = string.Empty;

        // WaitForURL
        [Parameter(Mandatory = false)]
        public string Url { get; set; } = string.Empty;

        // WaitForFunction
        [Parameter(Mandatory = false)]
        public string Expression { get; set; } = string.Empty;
        [Parameter(Mandatory = false)]
        public object Argument { get; set; } = null!;

        // WaitForLoadState
        [Parameter(Mandatory = false)]
        public LoadState State { get; set; }

        [Parameter(Mandatory = true)]
        [ValidateSet("Request", "Response", "URL", "Function", "LoadState", "Popup", "Download", "ConsoleMessage", "FileChooser", "RequestFinished", "WebSocket", "Worker")]
        public string EventType { get; set; } = string.Empty;

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            switch (EventType)
            {
                case "Request":
                    page.WaitForRequestAsync(UrlOrPredicate).GetAwaiter().GetResult();
                    break;
                case "Response":
                    page.WaitForResponseAsync(ResponseUrlOrPredicate).GetAwaiter().GetResult();
                    break;
                case "URL":
                    page.WaitForURLAsync(Url).GetAwaiter().GetResult();
                    break;
                case "Function":
                    page.WaitForFunctionAsync(Expression, Argument).GetAwaiter().GetResult();
                    break;
                case "LoadState":
                    page.WaitForLoadStateAsync(State).GetAwaiter().GetResult();
                    break;
                case "Popup":
                    page.WaitForPopupAsync().GetAwaiter().GetResult();
                    break;
                case "Download":
                    page.WaitForDownloadAsync().GetAwaiter().GetResult();
                    break;
                case "ConsoleMessage":
                    page.WaitForConsoleMessageAsync().GetAwaiter().GetResult();
                    break;
                case "FileChooser":
                    page.WaitForFileChooserAsync().GetAwaiter().GetResult();
                    break;
                case "RequestFinished":
                    page.WaitForRequestFinishedAsync().GetAwaiter().GetResult();
                    break;
                case "WebSocket":
                    page.WaitForWebSocketAsync().GetAwaiter().GetResult();
                    break;
                case "Worker":
                    page.WaitForWorkerAsync().GetAwaiter().GetResult();
                    break;
                default:
                    ThrowTerminatingError(new ErrorRecord(new System.Exception("Unknown parameter set."), "UnknownParameterSet", ErrorCategory.InvalidArgument, null));
                    break;
            }
        }
    }
}
