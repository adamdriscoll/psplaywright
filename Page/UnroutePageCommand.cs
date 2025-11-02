using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Remove, "PlaywrightPageRoute")]
    public class UnroutePageCommand : PlaywrightCmdletBase
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string UrlPattern { get; set; }

        protected override void ProcessRecord()
        {
            base.ProcessRecord();
            Page.UnrouteAsync(UrlPattern).GetAwaiter().GetResult();
        }
    }
}
