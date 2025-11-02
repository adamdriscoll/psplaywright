Describe 'Get-PlaywrightPageScreenshot' {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should accept valid Path' {
            $browser = Start-PlaywrightBrowser -Headless
            $page = Open-PlaywrightPage -Browser $browser
            Set-PlaywrightPageContent -Html '<html><body><h1>Screenshot Test</h1></body></html>' -Page $page
            $screenshotPath = (Join-Path (Get-Location) 'temp/screenshot.png')
            $null = $page | Get-PlaywrightPageScreenshot -Path $screenshotPath
            Test-Path $screenshotPath | Should -Be $true
            Remove-Item $screenshotPath -ErrorAction SilentlyContinue
            Stop-PlaywrightBrowser -Browser $browser
        }
    }
}
