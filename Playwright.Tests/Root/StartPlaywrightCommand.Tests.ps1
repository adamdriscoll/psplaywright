Describe 'Start-Playwright' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        try { Stop-Playwright } catch {}
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should accept default parameters' {
            # Replace with actual invocation and assertions
            Start-Playwright
            $PlaywrightContext.Playwright | Should -Not -Be $null
        }
        # Add more It blocks for each parameter
    }
}

Describe 'Stop-Playwright' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should accept default parameters' {
            Stop-Playwright
            $PlaywrightContext.Playwright | Should -Be $null
        }
    }
}
