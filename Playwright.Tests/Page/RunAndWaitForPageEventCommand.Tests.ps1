# Basic test for RunAndWaitForPageEventCommand
Describe "RunAndWaitForPageEventCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should run and wait for page event" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    $eventFired = $false
    Set-PlaywrightPageContent -Html "<html><body></body></html>" -Page $page
    $null = $page | Invoke-PlaywrightPageRunAndWaitForEvent -EventType "ConsoleMessage" -Action { $global:eventFired = $true }
    $true | Should -Be $true
    Stop-PlaywrightBrowser -Browser $browser
    }
}
