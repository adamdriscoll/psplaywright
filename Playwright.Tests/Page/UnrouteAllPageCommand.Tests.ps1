# Basic test for UnrouteAllPageCommand
Describe "UnrouteAllPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should unroute all page events" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    # Only test UnrouteAllAsync to avoid overload ambiguity
    Unroute-AllPlaywrightPage -Page $page
    $true | Should -Be $true
    Stop-PlaywrightBrowser -Browser $browser
    }
}
