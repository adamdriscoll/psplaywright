Describe 'Wait-PlaywrightPageEvent' {
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
