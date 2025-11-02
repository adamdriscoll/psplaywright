Describe 'Invoke-PlaywrightLocatorClick' {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should require Locator parameter' {
            { Invoke-PlaywrightLocatorClick } | Should -Throw
        }
        It 'Should accept valid Locator' {
            $result = Invoke-PlaywrightLocatorClick -Locator '#submit'
            $result | Should -Not -BeNullOrEmpty
        }
    }
}
