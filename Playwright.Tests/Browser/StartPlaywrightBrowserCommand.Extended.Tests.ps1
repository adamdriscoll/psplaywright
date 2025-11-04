Describe 'Start-PlaywrightBrowser - Extended Tests' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }

    Context 'Browser Types' {
        It 'Should start Chromium browser' {
            $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
            $browser | Should -Not -BeNullOrEmpty
            $browser.BrowserType.Name | Should -Be 'chromium'
            Stop-PlaywrightBrowser -Browser $browser
        }

        It 'Should start Firefox browser' {
            $browser = Start-PlaywrightBrowser -BrowserType 'firefox' -Headless
            $browser | Should -Not -BeNullOrEmpty
            $browser.BrowserType.Name | Should -Be 'firefox'
            Stop-PlaywrightBrowser -Browser $browser
        }
    }

    Context 'Browser Options' {
        It 'Should start browser in headless mode' {
            $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
            $browser | Should -Not -BeNullOrEmpty
            # Headless browsers should still be functional
            Stop-PlaywrightBrowser -Browser $browser
        }

        It 'Should start browser with Enter flag' {
            $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless -Enter
            $browser | Should -Not -BeNullOrEmpty
            # After Enter, browser should be in context
            Exit-PlaywrightBrowser
        }

        It 'Should handle multiple browser instances' {
            $browser1 = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
            $browser2 = Start-PlaywrightBrowser -BrowserType 'firefox' -Headless
            
            $browser1 | Should -Not -BeNullOrEmpty
            $browser2 | Should -Not -BeNullOrEmpty
            
            $browser1.BrowserType.Name | Should -Be 'chromium'
            $browser2.BrowserType.Name | Should -Be 'firefox'
            
            Stop-PlaywrightBrowser -Browser $browser1
            Stop-PlaywrightBrowser -Browser $browser2
        }
    }

    Context 'Browser Context' {
        It 'Should allow page creation after browser start' {
            $Server = Start-TestHttpServerInstance
            $TestPagePath = New-BasicTestHtmlPage -FileName 'browser-context-test.html' -Body '<div>Test</div>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            
            $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless -Enter
            $page = Open-PlaywrightPage -Url $pageUrl
            
            $page | Should -Not -BeNullOrEmpty
            
            Exit-PlaywrightBrowser
            Stop-TestHttpServer -Server $Server
            Remove-TestHtmlPagesFolder
        }

        It 'Should isolate browser contexts' {
            $browser1 = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
            $browser2 = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
            
            # Both browsers should be independent
            $browser1 | Should -Not -Be $browser2
            
            Stop-PlaywrightBrowser -Browser $browser1
            Stop-PlaywrightBrowser -Browser $browser2
        }
    }

    Context 'Error Handling' {
        It 'Should handle invalid browser type gracefully' {
            # Note: Playwright cmdlet should validate browser types
            # This test ensures proper parameter validation
            { Start-PlaywrightBrowser -BrowserType 'invalidbrowser' -Headless } | Should -Throw
        }

        It 'Should handle stopping with proper cleanup' {
            # Start and stop browser properly
            $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
            { Stop-PlaywrightBrowser -Browser $browser } | Should -Not -Throw
        }
    }
}
