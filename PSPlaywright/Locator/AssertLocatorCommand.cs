using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet("Assert", "PlaywrightLocator", DefaultParameterSetName = "IsVisible")]
    public class AssertLocatorCommand : PSCmdlet
    {
        // Common selector parameter
        [Parameter(Mandatory = true, Position = 0, ValueFromPipeline = true)]
        public ILocator? Locator { get; set; }

        // Assertion parameter sets
        [Parameter(ParameterSetName = "IsVisible")]
        public SwitchParameter IsVisible { get; set; }

        [Parameter(ParameterSetName = "IsHidden")]
        public SwitchParameter IsHidden { get; set; }

        [Parameter(ParameterSetName = "IsChecked")]
        public SwitchParameter IsChecked { get; set; }

        [Parameter(ParameterSetName = "IsDisabled")]
        public SwitchParameter IsDisabled { get; set; }

        [Parameter(ParameterSetName = "IsEditable")]
        public SwitchParameter IsEditable { get; set; }

        [Parameter(ParameterSetName = "IsEnabled")]
        public SwitchParameter IsEnabled { get; set; }

        [Parameter(ParameterSetName = "IsEmpty")]
        public SwitchParameter IsEmpty { get; set; }

        [Parameter(ParameterSetName = "IsFocused")]
        public SwitchParameter IsFocused { get; set; }

        [Parameter(ParameterSetName = "HasText")]
        public string? HasText { get; set; }

        [Parameter(ParameterSetName = "HasValue")]
        public string? HasValue { get; set; }

        [Parameter(ParameterSetName = "HasAttribute")]
        public string? AttributeName { get; set; }
        [Parameter(ParameterSetName = "HasAttribute")]
        public string? AttributeValue { get; set; }

        protected override void ProcessRecord()
        {
            var locator = Locator!;
            switch (this.ParameterSetName)
            {
                case "IsVisible":
                    Assertions.Expect(locator).ToBeVisibleAsync().GetAwaiter().GetResult();
                    break;
                case "IsHidden":
                    Assertions.Expect(locator).ToBeHiddenAsync().GetAwaiter().GetResult();
                    break;
                case "IsChecked":
                    Assertions.Expect(locator).ToBeCheckedAsync().GetAwaiter().GetResult();
                    break;
                case "IsDisabled":
                    Assertions.Expect(locator).ToBeDisabledAsync().GetAwaiter().GetResult();
                    break;
                case "IsEditable":
                    Assertions.Expect(locator).ToBeEditableAsync().GetAwaiter().GetResult();
                    break;
                case "IsEnabled":
                    Assertions.Expect(locator).ToBeEnabledAsync().GetAwaiter().GetResult();
                    break;
                case "IsEmpty":
                    Assertions.Expect(locator).ToBeEmptyAsync().GetAwaiter().GetResult();
                    break;
                case "IsFocused":
                    Assertions.Expect(locator).ToBeFocusedAsync().GetAwaiter().GetResult();
                    break;
                case "HasText":
                    if (string.IsNullOrEmpty(HasText))
                    {
                        ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("HasText"), "HasTextNull", ErrorCategory.InvalidArgument, HasText));
                        return;
                    }
                    Assertions.Expect(locator).ToHaveTextAsync(HasText).GetAwaiter().GetResult();
                    break;
                case "HasValue":
                    if (string.IsNullOrEmpty(HasValue))
                    {
                        ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("HasValue"), "HasValueNull", ErrorCategory.InvalidArgument, HasValue));
                        return;
                    }
                    Assertions.Expect(locator).ToHaveValueAsync(HasValue).GetAwaiter().GetResult();
                    break;
                case "HasAttribute":
                    if (string.IsNullOrEmpty(AttributeName) || string.IsNullOrEmpty(AttributeValue))
                    {
                        ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("HasAttribute"), "HasAttributeNull", ErrorCategory.InvalidArgument, AttributeName));
                        return;
                    }
                    Assertions.Expect(locator).ToHaveAttributeAsync(AttributeName, AttributeValue).GetAwaiter().GetResult();
                    break;
                default:
                    throw new PSArgumentException($"Unknown assertion parameter set: {this.ParameterSetName}");
            }
        }
    }
}
