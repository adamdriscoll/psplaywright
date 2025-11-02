Describe 'Assert-PlaywrightLocator' {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should require Locator parameter' {
            { Assert-PlaywrightLocator } | Should -Throw
        }
        It 'Should accept valid Locator' {
            $result = Assert-PlaywrightLocator -Locator '#main'
            $result | Should -Not -BeNullOrEmpty
        }
    }
}
