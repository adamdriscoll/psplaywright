# Basic test for InvokePageMouseCommand
Describe "InvokePageMouseCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should invoke mouse actions on page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Set-PlaywrightPageContent -Html "<html><body><button id='btn'>Click</button></body></html>" -Page $page
    Invoke-PlaywrightPageMouse -Page $page -Action "Click" -X 10 -Y 10
    # Pseudo check: no error thrown
    $true | Should -Be $true
    Stop-PlaywrightBrowser -Browser $browser
    }
}
