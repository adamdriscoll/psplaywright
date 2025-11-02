# Basic test for SetContentPageCommand
Describe "SetContentPageCommand" {
    It "Should set the page content" {
        # TODO: Add actual test logic
    $html = "<html><body><h1>Test Content</h1></body></html>"
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Set-PlaywrightPageContent -Html $html -Page $page
    $content = $page.ContentAsync().GetAwaiter().GetResult()
    $content | Should -Match "Test Content"
    Stop-PlaywrightBrowser -Browser $browser
    }
}
