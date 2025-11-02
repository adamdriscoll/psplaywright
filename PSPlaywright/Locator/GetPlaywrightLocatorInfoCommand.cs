using System.Management.Automation;
using Microsoft.Playwright;
using System.Threading.Tasks;

namespace PSPlaywright.Locator
{
    /// <summary>
    /// Cmdlet to query state and content from a Playwright Locator.
    /// Supports IsCheckedAsync, IsDisabledAsync, IsEditableAsync, IsEnabledAsync, IsHiddenAsync, IsVisibleAsync, CountAsync, GetAttributeAsync, InnerHTMLAsync, InnerTextAsync, TextContentAsync, InputValueAsync, AllInnerTextsAsync, AllTextContentsAsync, BoundingBoxAsync.
    /// See https://playwright.dev/dotnet/docs/api/class-locator for details.
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "PlaywrightLocatorInformation")]
    public class GetPlaywrightLocatorInfoCommand : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public ILocator? Locator { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "IsChecked")]
        public SwitchParameter IsChecked { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "IsDisabled")]
        public SwitchParameter IsDisabled { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "IsEditable")]
        public SwitchParameter IsEditable { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "IsEnabled")]
        public SwitchParameter IsEnabled { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "IsHidden")]
        public SwitchParameter IsHidden { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "IsVisible")]
        public SwitchParameter IsVisible { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "Count")]
        public SwitchParameter Count { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "GetAttribute")]
        public SwitchParameter GetAttribute { get; set; }

        [Parameter(ParameterSetName = "GetAttribute", Mandatory = true)]
        public string? AttributeName { get; set; } // For GetAttributeAsync

        [Parameter(Mandatory = true, ParameterSetName = "InnerHTML")]
        public SwitchParameter InnerHTML { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "InnerText")]
        public SwitchParameter InnerText { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "TextContent")]
        public SwitchParameter TextContent { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "InputValue")]
        public SwitchParameter InputValue { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "AllInnerTexts")]
        public SwitchParameter AllInnerTexts { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "AllTextContents")]
        public SwitchParameter AllTextContents { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "BoundingBox")]
        public SwitchParameter BoundingBox { get; set; }

        [Parameter]
        public double? Timeout { get; set; }

        protected override void ProcessRecord()
        {
            if (Locator == null) { ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException("Locator"), "LocatorNull", ErrorCategory.InvalidArgument, null)); return; }
            object? result = null;
            switch (ParameterSetName)
            {
                case "IsChecked":
                    var checkedOptions = new LocatorIsCheckedOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.IsCheckedAsync(checkedOptions).GetAwaiter().GetResult();
                    break;
                case "IsDisabled":
                    var disabledOptions = new LocatorIsDisabledOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.IsDisabledAsync(disabledOptions).GetAwaiter().GetResult();
                    break;
                case "IsEditable":
                    var editableOptions = new LocatorIsEditableOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.IsEditableAsync(editableOptions).GetAwaiter().GetResult();
                    break;
                case "IsEnabled":
                    var enabledOptions = new LocatorIsEnabledOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.IsEnabledAsync(enabledOptions).GetAwaiter().GetResult();
                    break;
                case "IsHidden":
                    var hiddenOptions = new LocatorIsHiddenOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.IsHiddenAsync(hiddenOptions).GetAwaiter().GetResult();
                    break;
                case "IsVisible":
                    var visibleOptions = new LocatorIsVisibleOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.IsVisibleAsync(visibleOptions).GetAwaiter().GetResult();
                    break;
                case "Count":
                    result = Locator.CountAsync().GetAwaiter().GetResult();
                    break;
                case "GetAttribute":
                    if (string.IsNullOrEmpty(AttributeName))
                        throw new System.ArgumentException("AttributeName must be provided for GetAttribute query.");
                    var attrOptions = new LocatorGetAttributeOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.GetAttributeAsync(AttributeName!, attrOptions).GetAwaiter().GetResult();
                    break;
                case "InnerHTML":
                    var htmlOptions = new LocatorInnerHTMLOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.InnerHTMLAsync(htmlOptions).GetAwaiter().GetResult();
                    break;
                case "InnerText":
                    var innerTextOptions = new LocatorInnerTextOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.InnerTextAsync(innerTextOptions).GetAwaiter().GetResult();
                    break;
                case "TextContent":
                    var textContentOptions = new LocatorTextContentOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.TextContentAsync(textContentOptions).GetAwaiter().GetResult();
                    break;
                case "InputValue":
                    var inputValueOptions = new LocatorInputValueOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.InputValueAsync(inputValueOptions).GetAwaiter().GetResult();
                    break;
                case "AllInnerTexts":
                    result = Locator.AllInnerTextsAsync().GetAwaiter().GetResult();
                    break;
                case "AllTextContents":
                    result = Locator.AllTextContentsAsync().GetAwaiter().GetResult();
                    break;
                case "BoundingBox":
                    var bboxOptions = new LocatorBoundingBoxOptions { Timeout = Timeout.HasValue ? (float?)Timeout.Value : null };
                    result = Locator.BoundingBoxAsync(bboxOptions).GetAwaiter().GetResult();
                    break;
                default:
                    throw new System.ArgumentException($"Unknown query type: {ParameterSetName}");
            }

            WriteObject(result);
        }
    }
}
