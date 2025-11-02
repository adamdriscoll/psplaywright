using System.Management.Automation;
using Microsoft.Playwright;
using psplaywright;

namespace PSPlaywright.Page
{
    [Cmdlet(VerbsCommon.Find, "PlaywrightPageElement", DefaultParameterSetName = "ByAltText")]
    [OutputType(typeof(ILocator))]
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
                // Gather locator info similar to GetPlaywrightLocatorInfoCommand
                var pso = new PSObject();
                pso.Properties.Add(new PSNoteProperty("Locator", locator));
                try { pso.Properties.Add(new PSNoteProperty("IsChecked", locator.IsCheckedAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("IsDisabled", locator.IsDisabledAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("IsEditable", locator.IsEditableAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("IsEnabled", locator.IsEnabledAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("IsHidden", locator.IsHiddenAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("IsVisible", locator.IsVisibleAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("Count", locator.CountAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("InnerHTML", locator.InnerHTMLAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("InnerText", locator.InnerTextAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("TextContent", locator.TextContentAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("InputValue", locator.InputValueAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("AllInnerTexts", locator.AllInnerTextsAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("AllTextContents", locator.AllTextContentsAsync().GetAwaiter().GetResult())); } catch { }
                try { pso.Properties.Add(new PSNoteProperty("BoundingBox", locator.BoundingBoxAsync().GetAwaiter().GetResult())); } catch { }
                WriteObject(pso);
            }
        }
    }
}
