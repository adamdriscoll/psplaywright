using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Invoke, "PageKeyboard", DefaultParameterSetName = "Type")]
    public class InvokePageKeyboardCommand : PageCommandBase
    {
        [Parameter(ParameterSetName = "Type", Mandatory = true)]
        public string? Text { get; set; }

        [Parameter(ParameterSetName = "Press", Mandatory = true)]
        public string? Key { get; set; }

        [Parameter(ParameterSetName = "Down", Mandatory = true)]
        public string? DownKey { get; set; }

        [Parameter(ParameterSetName = "Up", Mandatory = true)]
        public string? UpKey { get; set; }

        [Parameter(ParameterSetName = "InsertText", Mandatory = true)]
        public string? InsertText { get; set; }

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            var keyboard = page.Keyboard;

            switch (ParameterSetName)
            {
                case "Type":
                    keyboard.TypeAsync(Text!).GetAwaiter().GetResult();
                    break;
                case "Press":
                    keyboard.PressAsync(Key!).GetAwaiter().GetResult();
                    break;
                case "Down":
                    keyboard.DownAsync(DownKey!).GetAwaiter().GetResult();
                    break;
                case "Up":
                    keyboard.UpAsync(UpKey!).GetAwaiter().GetResult();
                    break;
                case "InsertText":
                    keyboard.InsertTextAsync(InsertText!).GetAwaiter().GetResult();
                    break;
            }
        }
    }
}
