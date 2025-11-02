# Basic test for StopPlaywrightCommand
Describe "StopPlaywrightCommand" {
    It "Should stop Playwright context" {
    $browser = Start-PlaywrightBrowser
    Stop-PlaywrightBrowser -Browser $browser
    # Pseudo check: browser should be disposed (actual validation depends on implementation)
    $browser.IsClosed | Should -Be $true
    }
}
