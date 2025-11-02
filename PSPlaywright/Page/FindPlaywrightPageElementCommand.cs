using System.Management.Automation;
using Microsoft.Playwright;
using psplaywright;

namespace PSPlaywright.Page
{
    [Cmdlet(VerbsCommon.Find, "PlaywrightPageElement", DefaultParameterSetName = "ByAltText")]
    [OutputType(typeof(IElementHandle))]
    public class FindPlaywrightPageElementCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, ParameterSetName = "ByAltText")]
        public string? AltText { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "ByLabel")]
        public string? Label { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "ByRole")]
        public string? Role { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "ByTestId")]
        public string? TestId { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "ByText")]
        public string? Text { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "ByTitle")]
        public string? Title { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "BySelector")]
        public string? Selector { get; set; }

        [Parameter(Mandatory = false, ParameterSetName = "BySelector")]
        public PageLocatorOptions? LocatorOptions { get; set; }

        protected override void ProcessRecord()
        {
            var Page = GetPageInstance();
            ILocator? locator = null;
            switch (ParameterSetName)
            {
                case "ByAltText":
                    if (!string.IsNullOrEmpty(AltText))
                        locator = Page.GetByAltText(AltText);
                    break;
                case "ByLabel":
                    if (!string.IsNullOrEmpty(Label))
                        locator = Page.GetByLabel(Label);
                    break;
                case "ByRole":
                    if (!string.IsNullOrEmpty(Role))
                    {
                        if (Enum.TryParse<AriaRole>(Role, true, out var ariaRole))
                        {
                            locator = Page.GetByRole(ariaRole);
                        }
                        else
                        {
                            ThrowTerminatingError(new ErrorRecord(new ArgumentException($"Invalid role: {Role}"), "InvalidRole", ErrorCategory.InvalidArgument, Role));
                            return;
                        }
                    }
                    break;
                case "ByTestId":
                    if (!string.IsNullOrEmpty(TestId))
                        locator = Page.GetByTestId(TestId);
                    break;
                case "ByText":
                    if (!string.IsNullOrEmpty(Text))
                        locator = Page.GetByText(Text);
                    break;
                case "ByTitle":
                    if (!string.IsNullOrEmpty(Title))
                        locator = Page.GetByTitle(Title);
                    break;
                case "BySelector":
                    if (!string.IsNullOrEmpty(Selector))
                    {
                        locator = LocatorOptions != null ? Page.Locator(Selector, LocatorOptions) : Page.Locator(Selector);
                    }
                    break;
            }

            if (locator != null)
            {
                var element = locator.ElementHandleAsync().GetAwaiter().GetResult();
                WriteObject(element);
            }
        }
    }
}
