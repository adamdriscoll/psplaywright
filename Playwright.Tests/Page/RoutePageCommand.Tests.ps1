# Basic test for RoutePageCommand
Describe "RoutePageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should route page events" {
        $browser = Start-PlaywrightBrowser
        $page = Open-PlaywrightPage -Browser $browser
        $intercepted = $false
        Register-PlaywrightPageRoute -Page $page -UrlPattern "**/*" -Action { $global:intercepted = $true; $args[0].ContinueAsync() }
        Set-PlaywrightPageContent -Html "<img src='test.png' />" -Page $page
        $page.EvaluateAsync("() => { var img = document.createElement('img'); img.src = 'test.png'; document.body.appendChild(img); }") | Out-Null
        Start-Sleep -Milliseconds 500
        $intercepted | Should -Be $true
        Stop-PlaywrightBrowser -Browser $browser
    }
}
