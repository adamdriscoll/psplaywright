Describe 'Assert-PlaywrightLocator - Extended Tests' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
        $script:TestServer = Start-TestHttpServerInstance
    }
    AfterAll {
        Stop-Playwright
        if ($script:TestServer) { Stop-TestHttpServer -ServerInfo $script:TestServer }
        Remove-TestHtmlPagesFolder
    }

    Context 'Negative Assertions' {
        It 'Should fail when asserting non-visible element is visible' {
            $hiddenBody = '<div id="hidden" style="display:none;">Hidden</div>'
            $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-not-visible.html' -Body $hiddenBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#hidden')
            
            # This should throw an error because element is not visible
            { Assert-PlaywrightLocator -Locator $locator -IsVisible } | Should -Throw
        }

        It 'Should fail when asserting visible element is hidden' {
            $visibleBody = '<div id="visible">Visible</div>'
            $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-not-hidden.html' -Body $visibleBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#visible')
            
            # This should throw an error because element is visible
            { Assert-PlaywrightLocator -Locator $locator -IsHidden } | Should -Throw
        }

        It 'Should fail when text does not match' {
            $textBody = '<div id="content">Actual Text</div>'
            $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-wrong-text.html' -Body $textBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#content')
            
            # This should throw an error because text doesn't match
            { Assert-PlaywrightLocator -Locator $locator -HasText 'Wrong Text' } | Should -Throw
        }
    }

    Context 'Complex Assertions' {
        It 'Should assert multiple attributes' {
            $attrBody = '<input id="multi" type="text" placeholder="Enter name" required />'
            $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-multi-attr.html' -Body $attrBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#multi')
            
            Assert-PlaywrightLocator -Locator $locator -AttributeName 'type' -AttributeValue 'text' | Should -BeNullOrEmpty
            Assert-PlaywrightLocator -Locator $locator -AttributeName 'placeholder' -AttributeValue 'Enter name' | Should -BeNullOrEmpty
        }

        It 'Should verify element has specific attribute value' {
            $attrBody = '<button id="btnSubmit" data-action="submit" data-priority="high">Submit</button>'
            $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-data-attr.html' -Body $attrBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#btnSubmit')
            
            Assert-PlaywrightLocator -Locator $locator -AttributeName 'data-action' -AttributeValue 'submit' | Should -BeNullOrEmpty
            Assert-PlaywrightLocator -Locator $locator -AttributeName 'data-priority' -AttributeValue 'high' | Should -BeNullOrEmpty
        }
    }

    Context 'Dynamic Content Assertions' {
        It 'Should wait for text to appear' {
            $dynamicBody = @'
<div id="dynamic">Loading...</div>
<script>
    setTimeout(() => {
        document.getElementById('dynamic').textContent = 'Loaded!';
    }, 500);
</script>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-dynamic.html' -Body $dynamicBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#dynamic')
            
            # Should wait for the text to appear
            Assert-PlaywrightLocator -Locator $locator -HasText 'Loaded!' | Should -BeNullOrEmpty
        }

        It 'Should assert readonly state' {
            $readonlyBody = '<input id="readonly" type="text" readonly value="Read Only" />'
            $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-readonly.html' -Body $readonlyBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#readonly')
            
            # readonly elements are not editable
            { Assert-PlaywrightLocator -Locator $locator -IsEditable } | Should -Throw
        }
    }

    Context 'Form Element Assertions' {
        It 'Should assert radio button selection' {
            $radioBody = @'
<input type="radio" id="option1" name="choice" value="1" checked />
<input type="radio" id="option2" name="choice" value="2" />
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-radio.html' -Body $radioBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#option1')
            
            Assert-PlaywrightLocator -Locator $locator -IsChecked | Should -BeNullOrEmpty
        }

        It 'Should assert select value' {
            $selectBody = @'
<select id="country">
    <option value="us" selected>United States</option>
    <option value="ca">Canada</option>
</select>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-select.html' -Body $selectBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#country')
            
            Assert-PlaywrightLocator -Locator $locator -HasValue 'us' | Should -BeNullOrEmpty
        }
    }
}
