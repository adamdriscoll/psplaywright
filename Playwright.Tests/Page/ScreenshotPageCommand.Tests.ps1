Describe 'Get-PlaywrightPageScreenshot' {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\..\PSPlaywright\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should require Path parameter' {
            { Get-PlaywrightPageScreenshot } | Should -Throw
        }
        It 'Should accept valid Path' {
            $result = Get-PlaywrightPageScreenshot -Path 'C:\temp\screenshot.png'
            $result | Should -Not -BeNullOrEmpty
        }
    }
}
