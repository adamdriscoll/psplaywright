using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsLifecycle.Invoke, "PlaywrightPageNavigation")]
    public class PageNavigationCommand : PageCommandBase
    {
        [Parameter(Mandatory = true, ParameterSetName = "GoBack")]
        public SwitchParameter Back { get; set; }

        [Parameter(Mandatory = true, ParameterSetName = "GoForward")]
        public SwitchParameter Forward { get; set; }

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            if (Back)
            {
                page.GoBackAsync().GetAwaiter().GetResult();
            }
            else if (Forward)
            {
                page.GoForwardAsync().GetAwaiter().GetResult();
            }
        }
    }
}
