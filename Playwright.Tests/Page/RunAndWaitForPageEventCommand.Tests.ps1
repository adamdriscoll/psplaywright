# Basic test for RunAndWaitForPageEventCommand
Describe "RunAndWaitForPageEventCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should run and wait for page event" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    $eventFired = $false
    Register-PlaywrightPageEvent -Page $page -EventName "load" -Action { $global:eventFired = $true }
    Set-PlaywrightPageContent -Html "<html><body></body></html>" -Page $page
    Run-AndWaitForPlaywrightPageEvent -Page $page -EventName "load"
    $eventFired | Should -Be $true
    Stop-PlaywrightBrowser -Browser $browser
    }
}
