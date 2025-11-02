Describe 'Wait-PlaywrightPageEvent' {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should require EventName parameter' {
            { Wait-PlaywrightPageEvent } | Should -Throw
        }
        It 'Should accept valid EventName' {
            $result = Wait-PlaywrightPageEvent -EventName 'LoadState'
            $result | Should -Not -BeNullOrEmpty
        }
    }
}
