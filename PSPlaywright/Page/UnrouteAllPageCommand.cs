using System.Management.Automation;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Remove, "PlaywrightPageAllRoutes")]
    public class UnrouteAllPageCommand : PageCommandBase
    {
        protected override void ProcessRecord()
        {
            GetPageInstance().UnrouteAllAsync().GetAwaiter().GetResult();
        }
    }
}
