# Basic test for SetContentPageCommand
Describe "SetContentPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should set the page content" {
        # TODO: Add actual test logic
    $html = "<html><body><h1>Test Content</h1></body></html>"
    $browser = Start-PlaywrightBrowser -Headless
    $page = Open-PlaywrightPage -Browser $browser
    Set-PlaywrightPageContent -Html $html -Page $page
    $content = $page.ContentAsync().GetAwaiter().GetResult()
    $content | Should -Match "Test Content"
    Stop-PlaywrightBrowser -Browser $browser
    }
}
