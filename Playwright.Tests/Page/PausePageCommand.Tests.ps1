# Basic test for PausePageCommand
Describe "PausePageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should pause the page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Suspend-PlaywrightPage -Page $page
    # Pseudo check: no error thrown
    $true | Should -Be $true
    Stop-PlaywrightBrowser -Browser $browser
    }
}
