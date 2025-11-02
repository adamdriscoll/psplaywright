Describe 'Open-PlaywrightPageUrl' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $Server = Start-TestHttpServerInstance
    }
    AfterAll {
        Stop-Playwright
        Stop-TestHttpServer -Server $Server
        Remove-TestHtmlPagesFolder
    }
    Context 'Parameter Validation' {
        It 'Should accept valid Url and load test file' {
            $testFileName = New-BasicTestHtmlPage -FileName 'GotoPageTest.html' -Title 'Goto Test' -Body '<div id="test">Hello Playwright!</div>'
            Start-PlaywrightBrowser -BrowserType 'chromium' -Enter
            $pageUrl = Get-TestHtmlPageUrl -FileName $testFileName
            $result = Open-PlaywrightPage -Url $pageUrl
            $result | Should -Not -BeNullOrEmpty
            Assert-PlaywrightLocator -Locator ($result.Locator('#test')) -HasText 'Hello Playwright!'
        }
    }
}
