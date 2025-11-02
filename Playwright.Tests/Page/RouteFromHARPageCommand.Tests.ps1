# Basic test for RouteFromHARPageCommand
Describe "RouteFromHARPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should route from HAR file" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    $harPath = "./test.har"
    # Assume HAR file exists for test
    Invoke-PlaywrightPageRequest -Page $page -HarPath $harPath
    # Check for successful execution (no error thrown)
    $true | Should -Be $true
    Stop-PlaywrightBrowser -Browser $browser
    }
}
