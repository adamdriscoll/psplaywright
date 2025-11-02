Describe 'Assert-PlaywrightLocator' {
    BeforeAll {
            Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
        # Create a test HTML page with a #main element
        $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-locator-test.html' -Body '<div id="main">Main Content</div>'
    }
    AfterAll {
    Stop-Playwright
    if ($global:testServer) { Stop-TestHttpServer -ServerInfo $global:testServer }
    Remove-TestHtmlPagesFolder
    }
    Context 'Parameter Validation' {
        It 'Should accept valid Locator' {
            Start-TestHttpServerInstance | Out-Null
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#main')
            $result = Assert-PlaywrightLocator -Locator $locator -IsVisible
            $result | Should -BeNullOrEmpty # Assert cmdlet returns nothing on success
        }
    }
}
