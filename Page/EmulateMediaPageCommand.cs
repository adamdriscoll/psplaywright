using System.Management.Automation;
using Microsoft.Playwright;

namespace PageCommands
{
    [Cmdlet(VerbsCommon.Set, "PlaywrightPageEmulateMedia")]
    public class EmulateMediaPageCommand : PSCmdlet
    {
    [Parameter(Mandatory = true, Position = 0)]
    public IPage? Page { get; set; }

    [Parameter(Position = 1)]
    public Media? Media { get; set; }

    [Parameter(Position = 2)]
    public ColorScheme? ColorScheme { get; set; }

        protected override void ProcessRecord()
        {
            if (Page == null)
            {
                ThrowTerminatingError(new ErrorRecord(new System.ArgumentNullException(nameof(Page)), "PageNull", ErrorCategory.InvalidArgument, null));
            }

            var options = new PageEmulateMediaOptions();
            if (Media != null)
                options.Media = Media;
            if (ColorScheme != null)
                options.ColorScheme = ColorScheme;

            Page!.EmulateMediaAsync(options).GetAwaiter().GetResult();
        }
    }
}
