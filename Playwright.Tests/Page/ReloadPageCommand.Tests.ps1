# Basic test for ReloadPageCommand
Describe "ReloadPageCommand" {
    It "Should reload the page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Set-PlaywrightPageContent -Html "<html><body><h1>Reload Test</h1></body></html>" -Page $page
    Reload-PlaywrightPage -Page $page
    $content = $page.ContentAsync().GetAwaiter().GetResult()
    $content | Should -Match "Reload Test"
    Stop-PlaywrightBrowser -Browser $browser
    }
}
