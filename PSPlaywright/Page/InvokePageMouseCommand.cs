using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Invoke, "PlaywrightPageMouse", DefaultParameterSetName = "Move")]
    public class InvokePageMouseCommand : PageCommandBase
    {
        // Move
        [Parameter(ParameterSetName = "Move", Mandatory = true)]
        public float? X { get; set; }
        [Parameter(ParameterSetName = "Move", Mandatory = true)]
        public float? Y { get; set; }
        [Parameter(ParameterSetName = "Move")]
        public int? Steps { get; set; }

        // Click
        [Parameter(ParameterSetName = "Click", Mandatory = true)]
        public float? ClickX { get; set; }
        [Parameter(ParameterSetName = "Click", Mandatory = true)]
        public float? ClickY { get; set; }
        [Parameter(ParameterSetName = "Click")]
        public int? ClickCount { get; set; }
        [Parameter(ParameterSetName = "Click")]
        public MouseButton? Button { get; set; }
        [Parameter(ParameterSetName = "Click")]
        public float? Delay { get; set; }

        // Down
        [Parameter(ParameterSetName = "Down")]
        public MouseButton? DownButton { get; set; }
        [Parameter(ParameterSetName = "Down")]
        public int? DownClickCount { get; set; }

        // Up
        [Parameter(ParameterSetName = "Up")]
        public MouseButton? UpButton { get; set; }
        [Parameter(ParameterSetName = "Up")]
        public int? UpClickCount { get; set; }

        // Wheel
        [Parameter(ParameterSetName = "Wheel", Mandatory = true)]
        public float? DeltaX { get; set; }
        [Parameter(ParameterSetName = "Wheel", Mandatory = true)]
        public float? DeltaY { get; set; }

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            var mouse = page.Mouse;
            switch (ParameterSetName)
            {
                case "Move":
                    var moveOptions = Steps.HasValue ? new MouseMoveOptions { Steps = Steps.Value } : null;
                    Nito.AsyncEx.AsyncContext.Run(() => mouse.MoveAsync(X!.Value, Y!.Value, moveOptions));
                    break;
                case "Click":
                    var clickOptions = new MouseClickOptions
                    {
                        Button = Button.HasValue ? Button.Value : MouseButton.Left,
                        ClickCount = ClickCount ?? 1,
                        Delay = Delay
                    };
                    Nito.AsyncEx.AsyncContext.Run(() => mouse.ClickAsync(ClickX!.Value, ClickY!.Value, clickOptions));
                    break;
                case "Down":
                    var downOptions = new MouseDownOptions
                    {
                        Button = DownButton.HasValue ? DownButton.Value : MouseButton.Left,
                        ClickCount = DownClickCount ?? 1
                    };
                    Nito.AsyncEx.AsyncContext.Run(() => mouse.DownAsync(downOptions));
                    break;
                case "Up":
                    var upOptions = new MouseUpOptions
                    {
                        Button = UpButton.HasValue ? UpButton.Value : MouseButton.Left,
                        ClickCount = UpClickCount ?? 1
                    };
                    Nito.AsyncEx.AsyncContext.Run(() => mouse.UpAsync(upOptions));
                    break;
                case "Wheel":
                    Nito.AsyncEx.AsyncContext.Run(() => mouse.WheelAsync(DeltaX!.Value, DeltaY!.Value));
                    break;
            }
        }
    }
}