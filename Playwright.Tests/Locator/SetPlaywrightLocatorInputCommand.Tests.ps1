Describe 'Set-PlaywrightLocatorInput' {
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
