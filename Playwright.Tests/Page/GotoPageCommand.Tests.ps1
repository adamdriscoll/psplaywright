Describe 'Open-PlaywrightPageUrl' {
    Context 'Parameter Validation' {
        It 'Should require Url parameter' {
            { Open-PlaywrightPageUrl } | Should -Throw
        }
        It 'Should accept valid Url' {
            $result = Open-PlaywrightPageUrl -Url 'https://example.com'
            $result | Should -Not -BeNullOrEmpty
        }
    }
}
