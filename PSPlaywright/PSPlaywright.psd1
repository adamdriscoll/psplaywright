@{
    RootModule        = 'PSPlaywright.psm1'
    ModuleVersion     = '0.1.0'
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
        'Set-PlaywrightPageToFront',
        'Close-PlaywrightPage',
        'Get-PlaywrightPageContent',
        'Set-PlaywrightPageDragAndDrop',
        'Set-PlaywrightPageMedia',
        'Enter-PlaywrightPage',
        'Get-PlaywrightPageJavascriptHandle',
        'Exit-PlaywrightPage',
        'Find-PlaywrightPageElement',
        'Open-PlaywrightPageUrl',
        'Invoke-PlaywrightPageJavascript',
        'Invoke-PlaywrightPageKeyboard',
        'Invoke-PlaywrightPageMouse',
        'Get-PlaywrightPageOpener',
        'Invoke-PlaywrightPageNavigation',
        'Suspend-PlaywrightPage',
        'Get-PlaywrightPagePdf',
        'Reset-PlaywrightPage',
        'Remove-PlaywrightPageLocatorHandler',
        'Invoke-PlaywrightPageGarageCollection',
        'Register-PlaywrightPageRouteHandler',
        'Invoke-PlaywrightPageRequest',
        'Invoke-PlaywrightPageRunAndWaitForEvent',
        'Get-PlaywrightPageScreenshot',
        'Set-PlaywrightPageContent',
        'Set-PlaywrightPageViewportSize',
        'Get-PlaywrightPageTitle',
        'Unregister-PlaywrightPageRoute',
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
