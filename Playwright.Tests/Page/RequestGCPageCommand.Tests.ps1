# Basic test for RequestGCPageCommand
Describe "RequestGCPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should request garbage collection on page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Request-GCPlaywrightPage -Page $page
    # Pseudo check: no error thrown
    $true | Should -Be $true
    Stop-PlaywrightBrowser -Browser $browser
    }
}
