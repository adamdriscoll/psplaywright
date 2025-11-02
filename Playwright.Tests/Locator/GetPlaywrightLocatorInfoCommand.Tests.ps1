Describe 'Get-PlaywrightLocatorInfo' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
        $TestServer = Start-TestHttpServerInstance | Out-Null
        $TestPagePath = New-BasicTestHtmlPage -FileName 'locator-info-test.html' -Body '<div id="myElement">Test</div><div id="first">First</div><div id="second">Second</div>'
    }
    AfterAll {
        Stop-Playwright
        if ($TestServer) { Stop-TestHttpServer -ServerInfo $TestServer }
        Remove-TestHtmlPagesFolder
    }
    Context 'Parameter Validation' {
        It 'Should return locator info for valid selector' {
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#myElement')
            $result = Get-PlaywrightLocatorInformation -Locator $locator
            $result | Should -Not -BeNullOrEmpty
        }

        It 'Should handle empty locator parameter' {
            { Get-PlaywrightLocatorInformation -Locator $null } | Should -Throw
        }

        It 'Should handle missing locator parameter' {
            { Get-PlaywrightLocatorInformation } | Should -Throw
        }

        It 'Should return info for multiple locators' {
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $selectors = @('#first', '#second')
            foreach ($selector in $selectors) {
                $locator = $page.Locator($selector)
                $result = Get-PlaywrightLocatorInformation -Locator $locator
                $result | Should -Not -BeNullOrEmpty
            }
        }
    }
}
