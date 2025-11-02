Describe 'Open-PlaywrightPageUrl' {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
    }
    AfterAll {
           Stop-Playwright
           Remove-TestHtmlPagesFolder
    }
    Context 'Parameter Validation' {
        It 'Should accept valid Url and load test file' {
            Start-TestHttpServerInstance | Out-Null
            $testFileName = New-BasicTestHtmlPage -FileName 'GotoPageTest.html' -Title 'Goto Test' -Body '<div id="test">Hello Playwright!</div>'
            Start-PlaywrightBrowser -BrowserType 'chromium' -Enter
            $pageUrl = Get-TestHtmlPageUrl -FileName $testFileName
            $result = Open-PlaywrightPage -Url $pageUrl
            $result | Should -Not -BeNullOrEmpty
            Assert-PlaywrightLocator -Locator ($result.Locator('#test')) -HasText 'Hello Playwright!'
        }
    }
}
