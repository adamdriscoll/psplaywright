Describe 'Invoke-PlaywrightLocatorClick' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $script:Server = Start-TestHttpServerInstance
        $script:browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
        $script:TestPagePath = New-BasicTestHtmlPage -FileName 'invoke-locator-click-test.html' -Body '<button id="submit">Submit</button>'
    }
    AfterAll {
        Stop-Playwright
        Stop-TestHttpServer -Server $script:Server
        Remove-TestHtmlPagesFolder
    }
    Context 'Parameter Validation' {
        It 'Should accept valid Locator' {
            $pageUrl = Get-TestHtmlPageUrl -FileName $script:TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#submit')
            $result = Invoke-PlaywrightLocatorClick -Locator $locator
            $result | Should -BeNullOrEmpty # Assert cmdlet returns nothing on success
        }
    }
}
