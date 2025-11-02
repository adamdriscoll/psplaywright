# Basic test for ReloadPageCommand
Describe "ReloadPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should reload the page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Set-PlaywrightPageContent -Html "<html><body><h1>Reload Test</h1></body></html>" -Page $page
    Reset-PlaywrightPage -Page $page
    $content = $page.ContentAsync().GetAwaiter().GetResult()
    $content | Should -Be "<html><head></head><body></body></html>"
    Stop-PlaywrightBrowser -Browser $browser
    }
}
