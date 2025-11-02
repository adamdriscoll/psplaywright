Describe 'Wait-PlaywrightPageEvent' {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should accept valid EventName' {
            $browser = Start-PlaywrightBrowser -Headless
            $page = Open-PlaywrightPage -Browser $browser
            $null = $page | Wait-PlaywrightPageEvent -EventType 'LoadState' -State ([Microsoft.Playwright.LoadState]::Load)
            $true | Should -Be $true
            Stop-PlaywrightBrowser -Browser $browser
        }
    }
}
