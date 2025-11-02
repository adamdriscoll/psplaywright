# Basic test for RouteFromHARPageCommand
Describe "RouteFromHARPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
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
    Route-FromHARPlaywrightPage -Page $page -HARPath $harPath
    # Pseudo check: ensure routing is set (actual validation depends on implementation)
    $page.Routes.Count | Should -BeGreaterThan 0
    Stop-PlaywrightBrowser -Browser $browser
    }
}
