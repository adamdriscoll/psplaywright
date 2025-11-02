using System.Management.Automation;
using Microsoft.Playwright;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace PSPlaywright.Locator
{
    /// <summary>
    /// Cmdlet to interact with select and checkbox elements using Playwright Locator.
    /// Supports CheckAsync, UncheckAsync, SetCheckedAsync, SelectOptionAsync, SetInputFilesAsync.
    /// See https://playwright.dev/dotnet/docs/api/class-locator for details.
    /// </summary>
    [Cmdlet("Set", "PlaywrightLocatorSelect")]
    public class SetPlaywrightLocatorSelectCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public ILocator? Locator { get; set; }

        [Parameter(Position = 1)]
        public string? Action { get; set; } = "Check"; // "Check", "Uncheck", "SetChecked", "SelectOption", "SetInputFiles"

        [Parameter]
        public bool? CheckedState { get; set; } // For SetCheckedAsync

        [Parameter]
        public string? SelectOptions { get; set; } // For SelectOptionAsync

        [Parameter]
        public string? InputFiles { get; set; } // For SetInputFilesAsync

        [Parameter]
        public bool? Force { get; set; }

        [Parameter]
        public double? Timeout { get; set; }

        protected override void ProcessRecord()
        {
            if (Locator == null) { ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("Locator"), "LocatorNull", ErrorCategory.InvalidArgument, null)); return; }
            Task task;
            switch ((Action ?? "Check").ToLower())
            {
                case "uncheck":
                    var uncheckOptions = new LocatorUncheckOptions
                    {
                        Force = Force,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null
                    };
                    task = Locator.UncheckAsync(uncheckOptions);
                    break;
                case "setchecked":
                    if (!CheckedState.HasValue)
                        throw new System.ArgumentException("CheckedState must be provided for SetChecked action.");
                    var setCheckedOptions = new LocatorSetCheckedOptions
                    {
                        Force = Force,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null
                    };
                    task = Locator.SetCheckedAsync(CheckedState.Value, setCheckedOptions);
                    break;
                case "selectoption":
                    if (SelectOptions == null || SelectOptions.Length == 0)
                        throw new System.ArgumentException("SelectOptions must be provided for SelectOption action.");
                    var selectOptionOptions = new LocatorSelectOptionOptions
                    {
                        Force = Force,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null
                    };
                    task = Locator.SelectOptionAsync(SelectOptions, selectOptionOptions);
                    break;
                case "setinputfiles":
                    if (InputFiles == null)
                        throw new System.ArgumentException("InputFiles must be provided for SetInputFiles action.");
                    var setInputFilesOptions = new LocatorSetInputFilesOptions
                    {
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null
                    };
                    task = Locator.SetInputFilesAsync(InputFiles, setInputFilesOptions);
                    break;
                default:
                    var checkOptions = new LocatorCheckOptions
                    {
                        Force = Force,
                        Timeout = Timeout.HasValue ? (float?)Timeout.Value : null
                    };
                    task = Locator.CheckAsync(checkOptions);
                    break;
            }
            task.GetAwaiter().GetResult();
        }
    }
}
