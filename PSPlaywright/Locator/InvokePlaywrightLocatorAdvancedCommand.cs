using System.Management.Automation;
using Microsoft.Playwright;
using System.Threading.Tasks;

namespace PSPlaywright.Locator
{
    /// <summary>
    /// Cmdlet for advanced locator actions: DragTo, Screenshot, ScrollIntoViewIfNeeded, DispatchEvent, WaitFor, AriaSnapshot, Evaluate, EvaluateAll, EvaluateHandle, SelectText.
    /// See https://playwright.dev/dotnet/docs/api/class-locator for details.
    /// </summary>
    [Cmdlet("Invoke", "PlaywrightLocatorAdvanced")]
    public class InvokePlaywrightLocatorAdvancedCommand : PSCmdlet
    {
    [Parameter(Mandatory = true, Position = 0)]
    public ILocator? Locator { get; set; }

    // Switch parameters for each action
    [Parameter(Mandatory = true, ParameterSetName = "DragTo")]
    public SwitchParameter DragTo { get; set; }
    [Parameter(Mandatory = true, ParameterSetName = "Screenshot")]
    public SwitchParameter Screenshot { get; set; }
    [Parameter(Mandatory = true, ParameterSetName = "ScrollIntoViewIfNeeded")]
    public SwitchParameter ScrollIntoViewIfNeeded { get; set; }
    [Parameter(Mandatory = true, ParameterSetName = "DispatchEvent")]
    public SwitchParameter DispatchEvent { get; set; }
    [Parameter(Mandatory = true, ParameterSetName = "WaitFor")]
    public SwitchParameter WaitFor { get; set; }
    [Parameter(Mandatory = true, ParameterSetName = "AriaSnapshot")]
    public SwitchParameter AriaSnapshot { get; set; }
    [Parameter(Mandatory = true, ParameterSetName = "Evaluate")]
    public SwitchParameter Evaluate { get; set; }
    [Parameter(Mandatory = true, ParameterSetName = "EvaluateAll")]
    public SwitchParameter EvaluateAll { get; set; }
    [Parameter(Mandatory = true, ParameterSetName = "EvaluateHandle")]
    public SwitchParameter EvaluateHandle { get; set; }
    [Parameter(Mandatory = true, ParameterSetName = "SelectText")]
    public SwitchParameter SelectText { get; set; }

    // Parameters for specific actions
    [Parameter(Mandatory = true, ParameterSetName = "DragTo")]
    public ILocator? TargetLocator { get; set; }

    [Parameter(ParameterSetName = "Screenshot")]
    public string? Path { get; set; }

    [Parameter(Mandatory = true, ParameterSetName = "DispatchEvent")]
    public string? EventType { get; set; }
    [Parameter(ParameterSetName = "DispatchEvent")]
    public object? EventInit { get; set; }

    [Parameter(ParameterSetName = "WaitFor")]
    public WaitForSelectorState? State { get; set; }

    // Shared parameters
    [Parameter(ParameterSetName = "DragTo")]
    [Parameter(ParameterSetName = "Screenshot")]
    [Parameter(ParameterSetName = "ScrollIntoViewIfNeeded")]
    [Parameter(ParameterSetName = "DispatchEvent")]
    [Parameter(ParameterSetName = "WaitFor")]
    [Parameter(ParameterSetName = "AriaSnapshot")]
    [Parameter(ParameterSetName = "Evaluate")]
    [Parameter(ParameterSetName = "EvaluateHandle")]
    [Parameter(ParameterSetName = "SelectText")]
    public double? Timeout { get; set; }

    [Parameter(ParameterSetName = "Evaluate")]
    [Parameter(ParameterSetName = "EvaluateAll")]
    [Parameter(ParameterSetName = "EvaluateHandle")]
    public string? Expression { get; set; }

    [Parameter(ParameterSetName = "Evaluate")]
    [Parameter(ParameterSetName = "EvaluateAll")]
    [Parameter(ParameterSetName = "EvaluateHandle")]
    public object? EvalArg { get; set; }

        protected override void ProcessRecord()
        {
            if (Locator == null) { ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("Locator"), "LocatorNull", ErrorCategory.InvalidArgument, null)); return; }
            object? result = null;
            switch (ParameterSetName)
            {
                case "DragTo":
                    if (TargetLocator == null)
                        throw new System.ArgumentException("TargetLocator must be provided for DragTo action.");
                    var dragOptions = new LocatorDragToOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    Locator.DragToAsync(TargetLocator, dragOptions).GetAwaiter().GetResult();
                    break;
                case "Screenshot":
                    var screenshotOptions = new LocatorScreenshotOptions { Path = Path, Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.ScreenshotAsync(screenshotOptions).GetAwaiter().GetResult();
                    break;
                case "ScrollIntoViewIfNeeded":
                    var scrollOptions = new LocatorScrollIntoViewIfNeededOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    Locator.ScrollIntoViewIfNeededAsync(scrollOptions).GetAwaiter().GetResult();
                    break;
                case "DispatchEvent":
                    if (string.IsNullOrEmpty(EventType))
                        throw new System.ArgumentException("EventType must be provided for DispatchEvent action.");
                    var dispatchOptions = new LocatorDispatchEventOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    Locator.DispatchEventAsync(EventType!, EventInit, dispatchOptions).GetAwaiter().GetResult();
                    break;
                case "WaitFor":
                    var waitOptions = new LocatorWaitForOptions { State = State, Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    Locator.WaitForAsync(waitOptions).GetAwaiter().GetResult();
                    break;
                case "AriaSnapshot":
                    var ariaOptions = new LocatorAriaSnapshotOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.AriaSnapshotAsync(ariaOptions).GetAwaiter().GetResult();
                    break;
                case "Evaluate":
                    if (string.IsNullOrEmpty(Expression))
                        throw new System.ArgumentException("Expression must be provided for Evaluate action.");
                    var evalOptions = new LocatorEvaluateOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.EvaluateAsync<object>(Expression!, EvalArg, evalOptions).GetAwaiter().GetResult();
                    break;
                case "EvaluateAll":
                    if (string.IsNullOrEmpty(Expression))
                        throw new System.ArgumentException("Expression must be provided for EvaluateAll action.");
                    result = Locator.EvaluateAllAsync<object>(Expression!, EvalArg).GetAwaiter().GetResult();
                    break;
                case "EvaluateHandle":
                    if (string.IsNullOrEmpty(Expression))
                        throw new System.ArgumentException("Expression must be provided for EvaluateHandle action.");
                    var evalHandleOptions = new LocatorEvaluateHandleOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.EvaluateHandleAsync(Expression!, EvalArg, evalHandleOptions).GetAwaiter().GetResult();
                    break;
                case "SelectText":
                    var selectTextOptions = new LocatorSelectTextOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    Locator.SelectTextAsync(selectTextOptions).GetAwaiter().GetResult();
                    break;
                default:
                    throw new System.ArgumentException($"Unknown advanced action parameter set: {ParameterSetName}");
            }
            if (result != null)
                WriteObject(result);
        }
    }
}
