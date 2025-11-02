# Basic test for RemoveLocatorHandlerPageCommand
Describe "RemoveLocatorHandlerPageCommand" {
    It "Should remove locator handler from page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    # Add a locator handler first
    $handlerId = Add-PlaywrightPageLocatorHandler -Page $page -Selector "#test" -Action { }
    Remove-PlaywrightPageLocatorHandler -Page $page -HandlerId $handlerId
    # Pseudo check: ensure handler is removed (actual validation depends on implementation)
    $handlers = $page.LocatorHandlers.Count
    $handlers | Should -Be 0
    Stop-PlaywrightBrowser -Browser $browser
    }
}
