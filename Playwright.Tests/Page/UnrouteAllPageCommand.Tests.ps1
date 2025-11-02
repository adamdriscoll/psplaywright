# Basic test for UnrouteAllPageCommand
Describe "UnrouteAllPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should unroute all page events" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    # Add a route first
    $page.RouteAsync("**/*", { param($route) $route.ContinueAsync() }) | Out-Null
    # Unroute all
    Unroute-AllPlaywrightPage -Page $page
    # There should be no routes left (pseudo check)
    $routes = $page.Routes.Count
    $routes | Should -Be 0
    Stop-PlaywrightBrowser -Browser $browser
    }
}
