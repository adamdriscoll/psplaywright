# Basic test for ReloadPageCommand
Describe "ReloadPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
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
