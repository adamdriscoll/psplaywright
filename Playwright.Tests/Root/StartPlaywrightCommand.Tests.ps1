Describe 'Start-Playwright' {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
    Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should accept default parameters' {
            # Replace with actual invocation and assertions
            $result = Start-Playwright
            $result | Should -Not -BeNullOrEmpty
        }
        # Add more It blocks for each parameter
    }
}

Describe 'Stop-Playwright' {
    BeforeAll {
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should accept default parameters' {
            $result = Stop-Playwright
            $result | Should -Not -BeNullOrEmpty
        }
    }
}
