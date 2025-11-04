Describe 'Set-PlaywrightLocatorSelect' {
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

    Context 'Checkbox Actions' {
        It 'Should check a checkbox' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'checkbox-test.html' -Body '<input id="agree" type="checkbox" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#agree')
            
            Set-PlaywrightLocatorSelect -Locator $locator -Action 'Check'
            $isChecked = $locator.IsCheckedAsync().GetAwaiter().GetResult()
            $isChecked | Should -Be $true
        }

        It 'Should uncheck a checkbox' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'checkbox-checked-test.html' -Body '<input id="agree" type="checkbox" checked />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#agree')
            
            Set-PlaywrightLocatorSelect -Locator $locator -Action 'Uncheck'
            $isChecked = $locator.IsCheckedAsync().GetAwaiter().GetResult()
            $isChecked | Should -Be $false
        }

        It 'Should set checked state to true' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'checkbox-setstate-test.html' -Body '<input id="agree" type="checkbox" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#agree')
            
            Set-PlaywrightLocatorSelect -Locator $locator -Action 'SetChecked' -CheckedState $true
            $isChecked = $locator.IsCheckedAsync().GetAwaiter().GetResult()
            $isChecked | Should -Be $true
        }

        It 'Should set checked state to false' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'checkbox-setstate-false-test.html' -Body '<input id="agree" type="checkbox" checked />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#agree')
            
            Set-PlaywrightLocatorSelect -Locator $locator -Action 'SetChecked' -CheckedState $false
            $isChecked = $locator.IsCheckedAsync().GetAwaiter().GetResult()
            $isChecked | Should -Be $false
        }
    }

    Context 'Select Option Actions' {
        It 'Should select an option by value' {
            $selectBody = @'
<select id="country">
    <option value="us">United States</option>
    <option value="ca">Canada</option>
    <option value="mx">Mexico</option>
</select>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'select-test.html' -Body $selectBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#country')
            
            Set-PlaywrightLocatorSelect -Locator $locator -Action 'SelectOption' -SelectOptions 'ca'
            $value = $locator.InputValueAsync().GetAwaiter().GetResult()
            $value | Should -Be 'ca'
        }

        It 'Should select multiple options' {
            $multiSelectBody = @'
<select id="colors" multiple>
    <option value="red">Red</option>
    <option value="blue">Blue</option>
    <option value="green">Green</option>
</select>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'multi-select-test.html' -Body $multiSelectBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#colors')
            
            Set-PlaywrightLocatorSelect -Locator $locator -Action 'SelectOption' -SelectOptions 'red'
            $script = "document.getElementById('colors').value"
            $value = Invoke-PlaywrightPageJavascript -Page $page -Expression $script
            $value | Should -Be 'red'
        }
    }
}
