Describe 'Set-PlaywrightLocatorInput' {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should require Locator and Value parameters' {
            { Set-PlaywrightLocatorInput } | Should -Throw
        }
        It 'Should accept valid Locator and Value' {
            $result = Set-PlaywrightLocatorInput -Locator '#username' -Value 'testuser'
            $result | Should -Not -BeNullOrEmpty
        }
    }
}
