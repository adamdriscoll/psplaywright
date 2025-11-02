@{
    RootModule        = 'PSPlaywright.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '0912bb76-1d95-4fe6-9513-37ac18e1b6ea'
    Author            = 'Adam Driscoll'
    CompanyName       = ''
    Description       = 'PSPlaywright is a PowerShell module for browser automation using Microsoft Playwright. It enables scripting and automation of web browsers from PowerShell.'
    CmdletsToExport   = @(
        'Start-Playwright',
        'Stop-Playwright',
        'Start-PlaywrightBrowser',
        'Stop-PlaywrightBrowser',
        'Open-PlaywrightPage',
        'Exit-PlaywrightBrowser',
        'Enter-PlaywrightBrowser',
        'Assert-PlaywrightLocator',
        'Get-PlaywrightLocatorInformation',
        'Invoke-PlaywrightLocatorAdvanced',
        'Invoke-PlaywrightLocatorClick',
        'Set-PlaywrightLocatorInput',
        'Set-PlaywrightLocatorSelect',
        'Add-PlaywrightPageLocatorHandler',
        'Add-PlaywrightPageInitScript',
        'BringToFront-PlaywrightPage',
        'Close-PlaywrightPage',
        'Content-PlaywrightPage',
        'DragAndDrop-PlaywrightPage',
        'EmulateMedia-PlaywrightPage',
        'Enter-PlaywrightPage',
        'EvaluateHandle-PlaywrightPage',
        'Exit-PlaywrightPage',
        'Find-PlaywrightPageElement',
        'Goto-PlaywrightPageUrl',
        'Invoke-PlaywrightPageJavascript',
        'Invoke-PlaywrightPageKeyboard',
        'Invoke-PlaywrightPageMouse',
        'Opener-PlaywrightPage',
        'PageNavigation-PlaywrightPage',
        'Pause-PlaywrightPage',
        'Pdf-PlaywrightPage',
        'Reload-PlaywrightPage',
        'Remove-PlaywrightPageLocatorHandler',
        'RequestGC-PlaywrightPage',
        'Route-PlaywrightPageHandler',
        'RouteFromHAR-PlaywrightPageRequest',
        'RunAndWaitFor-PlaywrightPageEvent',
        'Screenshot-PlaywrightPage',
        'Set-PlaywrightPageContent',
        'Set-PlaywrightPageDragAndDrop',
        'Set-PlaywrightPageMedia',
        'Set-PlaywrightPageToFront',
        'Set-PlaywrightPageViewportSize',
        'Title-PlaywrightPageTitle',
        'UnrouteAll-PlaywrightPageRoute',
        'Wait-PlaywrightPageEvent'
    )
    PrivateData       = @{
        PSData = @{
            Tags = @('Playwright', 'Browser', 'Automation', 'PowerShell', 'Web', 'Testing')
            LicenseUri = 'https://github.com/adamdriscoll/psplaywright/blob/main/LICENSE'
            ProjectUri        = 'https://github.com/adamdriscoll/psplaywright'
        }
    }
}
