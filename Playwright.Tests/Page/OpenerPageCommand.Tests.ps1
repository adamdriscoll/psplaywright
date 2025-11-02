# Basic test for OpenerPageCommand
Describe "OpenerPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should handle opener page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    $newPage = Open-PlaywrightPage -Browser $browser
    $opener = Get-PlaywrightPageOpener -Page $newPage
    $opener | Should -BeNullOrEmpty # Opener is null for new page, adjust as needed
    Stop-PlaywrightBrowser -Browser $browser
    }
}
