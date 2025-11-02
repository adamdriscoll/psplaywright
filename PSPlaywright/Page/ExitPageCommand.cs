using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Exit, "PlaywrightPage")]
    public class ExitPageCommand : PlaywrightContextCommand
    {
        protected override void ProcessRecord()
        {
            var context = GetPlaywrightContext();
            var page = context.ExitPage();
            if (page != null)
            {
                WriteObject(page);
            }
            else
            {
                WriteWarning("No page to exit from the stack.");
            }
        }
    }
}
