Describe 'Assert-PlaywrightLocator' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
        # Create a test HTML page with a #main element
    $script:TestServer = Start-TestHttpServerInstance
    $TestPagePath = New-BasicTestHtmlPage -FileName 'assert-locator-test.html' -Body '<div id="main">Main Content</div>'
    }
    AfterAll {
        Stop-Playwright
    if ($script:TestServer) { Stop-TestHttpServer -ServerInfo $script:TestServer }
        Remove-TestHtmlPagesFolder
    }
    Context 'Parameter Validation' {
        It 'Should assert IsVisible' {
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#main')
            Assert-PlaywrightLocator -Locator $locator -IsVisible | Should -BeNullOrEmpty
        }

        It 'Should assert IsHidden' {
            $hiddenPagePath = New-BasicTestHtmlPage -FileName 'hidden.html' -Body '<div id="hidden" style="display:none">Hidden</div>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $hiddenPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#hidden')
            Assert-PlaywrightLocator -Locator $locator -IsHidden | Should -BeNullOrEmpty
        }

        It 'Should assert IsChecked' {
            $checkedPagePath = New-BasicTestHtmlPage -FileName 'checked.html' -Body '<input id="check" type="checkbox" checked />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $checkedPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#check')
            Assert-PlaywrightLocator -Locator $locator -IsChecked | Should -BeNullOrEmpty
        }

        It 'Should assert IsDisabled' {
            $disabledPagePath = New-BasicTestHtmlPage -FileName 'disabled.html' -Body '<button id="btn" disabled>Disabled</button>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $disabledPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#btn')
            Assert-PlaywrightLocator -Locator $locator -IsDisabled | Should -BeNullOrEmpty
        }

        It 'Should assert IsEditable' {
            $editablePagePath = New-BasicTestHtmlPage -FileName 'editable.html' -Body '<input id="edit" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $editablePagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#edit')
            Assert-PlaywrightLocator -Locator $locator -IsEditable | Should -BeNullOrEmpty
        }

        It 'Should assert IsEnabled' {
            $enabledPagePath = New-BasicTestHtmlPage -FileName 'enabled.html' -Body '<button id="btn2">Enabled</button>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $enabledPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#btn2')
            Assert-PlaywrightLocator -Locator $locator -IsEnabled | Should -BeNullOrEmpty
        }

        It 'Should assert IsEmpty' {
            $emptyPagePath = New-BasicTestHtmlPage -FileName 'empty.html' -Body '<input id="empty" value="" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $emptyPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#empty')
            Assert-PlaywrightLocator -Locator $locator -IsEmpty | Should -BeNullOrEmpty
        }

        It 'Should assert IsFocused' {
            $focusedPagePath = New-BasicTestHtmlPage -FileName 'focused.html' -Body '<input id="focus" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $focusedPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#focus')
            $locator.FocusAsync() | Out-Null
            Assert-PlaywrightLocator -Locator $locator -IsFocused | Should -BeNullOrEmpty
        }

        It 'Should assert HasText' {
            $textPagePath = New-BasicTestHtmlPage -FileName 'hastext.html' -Body '<div id="txt">Hello World</div>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $textPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#txt')
            Assert-PlaywrightLocator -Locator $locator -HasText 'Hello World' | Should -BeNullOrEmpty
        }

        It 'Should assert HasValue' {
            $valuePagePath = New-BasicTestHtmlPage -FileName 'hasvalue.html' -Body '<input id="val" value="abc123" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $valuePagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#val')
            Assert-PlaywrightLocator -Locator $locator -HasValue 'abc123' | Should -BeNullOrEmpty
        }

        It 'Should assert HasAttribute' {
            $attrPagePath = New-BasicTestHtmlPage -FileName 'hasattr.html' -Body '<div id="attr" data-test="xyz"></div>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $attrPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#attr')
            Assert-PlaywrightLocator -Locator $locator -AttributeName 'data-test' -AttributeValue 'xyz' | Should -BeNullOrEmpty
        }
    }
}
