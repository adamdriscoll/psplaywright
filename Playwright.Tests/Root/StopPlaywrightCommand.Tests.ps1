# Basic test for StopPlaywrightCommand
Describe "StopPlaywrightCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should stop Playwright context" {
    $browser = Start-PlaywrightBrowser
    Stop-PlaywrightBrowser -Browser $browser
    # Pseudo check: browser should be disposed (actual validation depends on implementation)
    $browser.IsClosed | Should -Be $true
    }
}
