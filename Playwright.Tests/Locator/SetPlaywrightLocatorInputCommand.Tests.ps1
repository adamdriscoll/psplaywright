Describe 'Set-PlaywrightLocatorInput' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
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
            $page = Open-PlaywrightPage -Url 'https://example.com'
            $locator = $page.Locator('#username')
            $result = Set-PlaywrightLocatorInput -Locator $locator -Value 'testuser'
            $result | Should -Not -BeNullOrEmpty
    }
}
