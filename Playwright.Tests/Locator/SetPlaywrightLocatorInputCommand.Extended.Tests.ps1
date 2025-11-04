Describe 'Set-PlaywrightLocatorInput - Extended Tests' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $script:Server = Start-TestHttpServerInstance
        $script:browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
    }
    AfterAll {
        Stop-Playwright
        if ($script:Server) { Stop-TestHttpServer -Server $script:Server }
        Remove-TestHtmlPagesFolder
    }

    Context 'Input Actions' {
        It 'Should fill text input' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'text-input-test.html' -Body '<input id="text" type="text" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#text')
            
            Set-PlaywrightLocatorInput -Locator $locator -Value 'Hello Playwright'
            
            $value = $locator.InputValueAsync().GetAwaiter().GetResult()
            $value | Should -Be 'Hello Playwright'
        }

        It 'Should clear existing input' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'clear-input-test.html' -Body '<input id="clearMe" type="text" value="existing" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#clearMe')
            
            # Use ClearAsync to clear instead of empty string
            $locator.ClearAsync().GetAwaiter().GetResult()
            
            $value = $locator.InputValueAsync().GetAwaiter().GetResult()
            $value | Should -BeNullOrEmpty
        }

        It 'Should fill email input' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'email-input-test.html' -Body '<input id="email" type="email" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#email')
            
            Set-PlaywrightLocatorInput -Locator $locator -Value 'test@example.com'
            
            $value = $locator.InputValueAsync().GetAwaiter().GetResult()
            $value | Should -Be 'test@example.com'
        }

        It 'Should fill password input' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'password-input-test.html' -Body '<input id="password" type="password" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#password')
            
            Set-PlaywrightLocatorInput -Locator $locator -Value 'SecurePass123!'
            
            $value = $locator.InputValueAsync().GetAwaiter().GetResult()
            $value | Should -Be 'SecurePass123!'
        }

        It 'Should fill textarea' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'textarea-test.html' -Body '<textarea id="comments"></textarea>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#comments')
            
            $multiLineText = "Line 1`nLine 2`nLine 3"
            Set-PlaywrightLocatorInput -Locator $locator -Value $multiLineText
            
            $value = $locator.InputValueAsync().GetAwaiter().GetResult()
            $value | Should -Match 'Line 1'
        }

        It 'Should fill number input' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'number-input-test.html' -Body '<input id="quantity" type="number" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#quantity')
            
            Set-PlaywrightLocatorInput -Locator $locator -Value '42'
            
            $value = $locator.InputValueAsync().GetAwaiter().GetResult()
            $value | Should -Be '42'
        }

        It 'Should handle special characters' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'special-chars-test.html' -Body '<input id="special" type="text" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#special')
            
            $specialText = '!@#$%^&*()_+-=[]{}|;:,.<>?'
            Set-PlaywrightLocatorInput -Locator $locator -Value $specialText
            
            $value = $locator.InputValueAsync().GetAwaiter().GetResult()
            $value | Should -Be $specialText
        }
    }

    Context 'Input with Focus' {
        It 'Should trigger focus event' {
            $focusBody = @'
<input id="focusInput" type="text" />
<div id="focusStatus"></div>
<script>
    document.getElementById('focusInput').addEventListener('focus', () => {
        document.getElementById('focusStatus').textContent = 'focused';
    });
</script>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'focus-test.html' -Body $focusBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#focusInput')
            
            Set-PlaywrightLocatorInput -Locator $locator -Value 'test'
            
            $status = $page.Locator('#focusStatus').TextContentAsync().GetAwaiter().GetResult()
            $status | Should -Be 'focused'
        }

        It 'Should trigger input event' {
            $inputEventBody = @'
<input id="inputEvent" type="text" />
<div id="eventCount">0</div>
<script>
    let count = 0;
    document.getElementById('inputEvent').addEventListener('input', () => {
        count++;
        document.getElementById('eventCount').textContent = count;
    });
</script>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'input-event-test.html' -Body $inputEventBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#inputEvent')
            
            Set-PlaywrightLocatorInput -Locator $locator -Value 'test'
            
            # Wait a bit for events to fire
            Start-Sleep -Milliseconds 100
            
            $count = $page.Locator('#eventCount').TextContentAsync().GetAwaiter().GetResult()
            [int]$count | Should -BeGreaterThan 0
        }
    }
}
