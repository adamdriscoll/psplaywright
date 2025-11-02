using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageGoBack")]
    public class GoBackPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            page.GoBackAsync().GetAwaiter().GetResult();
        }
    }
}
