Describe 'Start-PlaywrightBrowser' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should accept default parameters' {
            $result = Start-PlaywrightBrowser
            $result | Should -Not -BeNullOrEmpty
        }
        # Add more It blocks for each parameter
    }
}

Describe 'Stop-PlaywrightBrowser' {
    BeforeAll {
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should accept default parameters' {
            $result = Stop-PlaywrightBrowser
            $result | Should -Not -BeNullOrEmpty
        }
    }
}
