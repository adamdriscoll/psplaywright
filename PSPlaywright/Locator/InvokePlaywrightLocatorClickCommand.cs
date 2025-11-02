using System.Management.Automation;
using Microsoft.Playwright;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace PSPlaywright.Locator
{
    /// <summary>
    /// Cmdlet to invoke click, double-click, or tap actions on a Playwright Locator.
    /// Supports ClickAsync, DblClickAsync, and TapAsync methods.
    /// See https://playwright.dev/dotnet/docs/api/class-locator for details.
    /// </summary>
    [Cmdlet("Invoke", "PlaywrightLocatorClick")]
    public class InvokePlaywrightLocatorClickCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public ILocator? Locator { get; set; }

        [Parameter(Position = 1)]
        [ValidateSet("Click", "DblClick", "Tap")]
        public string? Action { get; set; } = "Click"; // "Click", "DblClick", "Tap"

        [Parameter]
        public string? Button { get; set; } // "left", "right", "middle"

        [Parameter]
        public int? ClickCount { get; set; }

        [Parameter]
        public double? Delay { get; set; }

        [Parameter]
        public bool? Force { get; set; }

        [Parameter]
        public int? X { get; set; }

        [Parameter]
        public int? Y { get; set; }

        [Parameter]
        public KeyboardModifier[]? Modifiers { get; set; }

        [Parameter]
        public bool? Trial { get; set; }

        [Parameter]
        public double? Timeout { get; set; }

        protected override void ProcessRecord()
        {
            if (Locator == null) { ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("Locator"), "LocatorNull", ErrorCategory.InvalidArgument, null)); return; }
            var position = (X.HasValue && Y.HasValue) ? new Position { X = X.Value, Y = Y.Value } : null;
            Task task;
            MouseButton? mouseButton = null;
            if (Button != null)
            {
                if (Enum.TryParse(Button, true, out MouseButton parsedBtn))
                {
                    mouseButton = parsedBtn;
                }
                else
                {
                    mouseButton = MouseButton.Left;
                }
            }
            switch ((Action ?? "Click").ToLower())
            {
                case "dblclick":
                    var dblClickOptions = new LocatorDblClickOptions
                    {
                        Button = mouseButton,
                        Delay = Delay.HasValue ? (float?)Delay.Value : null,
                        Force = Force,
                        Modifiers = Modifiers,
                        Position = position,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null,
                        Trial = Trial
                    };
                    task = Locator.DblClickAsync(dblClickOptions);
                    break;
                case "tap":
                    var tapOptions = new LocatorTapOptions
                    {
                        Force = Force,
                        Modifiers = Modifiers,
                        Position = position,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null,
                        Trial = Trial
                    };
                    task = Locator.TapAsync(tapOptions);
                    break;
                default:
                    var clickOptions = new LocatorClickOptions
                    {
                        Button = mouseButton,
                        ClickCount = ClickCount,
                        Delay = Delay.HasValue ? (float?)Delay.Value : null,
                        Force = Force,
                        Modifiers = Modifiers,
                        Position = position,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null,
                        Trial = Trial
                    };
                    task = Locator.ClickAsync(clickOptions);
                    break;
            }
            task.GetAwaiter().GetResult();
        }
    }
}
