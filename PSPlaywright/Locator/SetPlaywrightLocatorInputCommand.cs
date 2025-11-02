using System.Management.Automation;
using Microsoft.Playwright;
using System.Threading.Tasks;

namespace PSPlaywright.Locator
{
    /// <summary>
    /// Cmdlet to fill, clear, or press keys in a Playwright Locator.
    /// Supports FillAsync, ClearAsync, PressAsync, and PressSequentiallyAsync methods.
    /// See https://playwright.dev/dotnet/docs/api/class-locator for details.
    /// </summary>
    [Cmdlet("Set", "PlaywrightLocatorInput")]
    public class SetPlaywrightLocatorInputCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public ILocator? Locator { get; set; }

        [Parameter(Position = 1)]
        public string? Action { get; set; } = "Fill"; // "Fill", "Clear", "Press", "PressSequentially"

        [Parameter]
        public string? Value { get; set; } // For FillAsync, PressAsync, PressSequentiallyAsync

        [Parameter]
        public double? Delay { get; set; } // For PressAsync, PressSequentiallyAsync

        [Parameter]
        public bool? Force { get; set; } // For FillAsync, ClearAsync

        [Parameter]
        public double? Timeout { get; set; }

        protected override void ProcessRecord()
        {
            if (Locator == null) { ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("Locator"), "LocatorNull", ErrorCategory.InvalidArgument, null)); return; }
            Task task;
            switch ((Action ?? "Fill").ToLower())
            {
                case "clear":
                    var clearOptions = new LocatorClearOptions
                    {
                        Force = Force,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null
                    };
                    task = Locator.ClearAsync(clearOptions);
                    break;
                case "press":
                    if (string.IsNullOrEmpty(Value))
                        throw new System.ArgumentException("Value (key) must be provided for Press action.");
                    var pressOptions = new LocatorPressOptions
                    {
                        Delay = Delay.HasValue ? (float?)Delay.Value : null,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null
                    };
                    task = Locator.PressAsync(Value, pressOptions);
                    break;
                case "presssequentially":
                    if (string.IsNullOrEmpty(Value))
                        throw new System.ArgumentException("Value (text) must be provided for PressSequentially action.");
                    var pressSeqOptions = new LocatorPressSequentiallyOptions
                    {
                        Delay = Delay.HasValue ? (float?)Delay.Value : null,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null
                    };
                    task = Locator.PressSequentiallyAsync(Value, pressSeqOptions);
                    break;
                default:
                    if (string.IsNullOrEmpty(Value))
                        throw new System.ArgumentException("Value must be provided for Fill action.");
                    var fillOptions = new LocatorFillOptions
                    {
                        Force = Force,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null
                    };
                    task = Locator.FillAsync(Value, fillOptions);
                    break;
            }
            task.GetAwaiter().GetResult();
        }
    }
}
