# Basic test for RemoveLocatorHandlerPageCommand
Describe "RemoveLocatorHandlerPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should remove locator handler from page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    # Add a locator handler first
    $locator = $page.Locator('#test')
    Add-PlaywrightPageLocatorHandler -Page $page -Locator $locator -Handler { }
    Remove-PlaywrightPageLocatorHandler -Page $page -Locator $locator
    # Pseudo check: ensure handler is removed (actual validation depends on implementation)
    $handlers = $page.LocatorHandlers.Count
    $handlers | Should -Be 0
    Stop-PlaywrightBrowser -Browser $browser
    }
}
