using System.Management.Automation;
using Microsoft.Playwright;

namespace psplaywright
{
    public abstract class PlaywrightContextCommand : PSCmdlet
    {
        protected PlaywrightContextCommand()
        {
            // Initialize Playwright context
            var globalVar = SessionState?.PSVariable?.Get(Constants.PlaywrightContext);
            if (globalVar?.Value is not PlaywrightContext)
            {
                var context = new PlaywrightContext();
                SessionState?.PSVariable?.Set(Constants.PlaywrightContext, context);
            }
        }

        protected PlaywrightContext GetPlaywrightContext()
        {
            var globalVar = SessionState?.PSVariable?.Get(Constants.PlaywrightContext);
            if (globalVar?.Value is PlaywrightContext context)
                return context;

            throw new Exception("Playwright context not found. Please initialize Playwright first.");
        }
    }
}
