using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsLifecycle.Wait, "PlaywrightPageEvent")]
    public class WaitForPageEventCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public IPage Page { get; set; }

        // WaitForRequest
        [Parameter(Mandatory = true, ParameterSetName = "Request")]
        public string UrlOrPredicate { get; set; }

        // WaitForResponse
        [Parameter(Mandatory = true, ParameterSetName = "Response")]
        public string ResponseUrlOrPredicate { get; set; }

        // WaitForURL
        [Parameter(Mandatory = true, ParameterSetName = "URL")]
        public string Url { get; set; }

        // WaitForFunction
        [Parameter(Mandatory = true, ParameterSetName = "Function")]
        public string Expression { get; set; }
        [Parameter(ParameterSetName = "Function")]
        public object Argument { get; set; }

        // WaitForLoadState
        [Parameter(Mandatory = true, ParameterSetName = "LoadState")]
        public LoadState State { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            switch (ParameterSetName)
            {
                case "Request":
                    Page.WaitForRequestAsync(UrlOrPredicate).GetAwaiter().GetResult();
                    break;
                case "Response":
                    Page.WaitForResponseAsync(ResponseUrlOrPredicate).GetAwaiter().GetResult();
                    break;
                case "URL":
                    Page.WaitForURLAsync(Url).GetAwaiter().GetResult();
                    break;
                case "Function":
                    Page.WaitForFunctionAsync(Expression, Argument).GetAwaiter().GetResult();
                    break;
                case "LoadState":
                    Page.WaitForLoadStateAsync(State).GetAwaiter().GetResult();
                    break;
                case "Popup":
                    Page.WaitForPopupAsync().GetAwaiter().GetResult();
                    break;
                case "Download":
                    Page.WaitForDownloadAsync().GetAwaiter().GetResult();
                    break;
                case "ConsoleMessage":
                    Page.WaitForConsoleMessageAsync().GetAwaiter().GetResult();
                    break;
                case "FileChooser":
                    Page.WaitForFileChooserAsync().GetAwaiter().GetResult();
                    break;
                case "RequestFinished":
                    Page.WaitForRequestFinishedAsync().GetAwaiter().GetResult();
                    break;
                case "WebSocket":
                    Page.WaitForWebSocketAsync().GetAwaiter().GetResult();
                    break;
                case "Worker":
                    Page.WaitForWorkerAsync().GetAwaiter().GetResult();
                    break;
                default:
                    ThrowTerminatingError(new ErrorRecord(new System.Exception("Unknown parameter set."), "UnknownParameterSet", ErrorCategory.InvalidArgument, null));
                    break;
            }
        }
    }
}
