using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageMedia")]
    public class EmulateMediaPageCommand : PageCommandBase
    {
    [Parameter(Position = 1)]
    public Media? Media { get; set; }

    [Parameter(Position = 2)]
    public ColorScheme? ColorScheme { get; set; }

        protected override void ProcessRecord()
        {
            var page = GetPageInstance();
            var options = new PageEmulateMediaOptions();
            if (Media != null)
                options.Media = Media;
            if (ColorScheme != null)
                options.ColorScheme = ColorScheme;

            page.EmulateMediaAsync(options).GetAwaiter().GetResult();
        }
    }
}
