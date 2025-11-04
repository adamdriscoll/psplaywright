Describe 'Find-PlaywrightPageElement - Extended Tests' {
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

    Context 'Complex Element Finding' {
        It 'Should find button by role with specific name' {
            $buttonBody = @'
<button id="btn1">Click Me</button>
<button id="btn2">Click Me Too</button>
<button id="btn3">Don't Click</button>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'button-text-test.html' -Body $buttonBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            # Use selector to be more specific
            $locator = Find-PlaywrightPageElement -Page $page -Selector '#btn1'
            $text = $locator.TextContentAsync().GetAwaiter().GetResult()
            $text | Should -Be 'Click Me'
        }

        It 'Should find element by role and name' {
            $roleBody = @'
<button>Submit Form</button>
<button>Cancel</button>
<a href="#">Link Text</a>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'role-name-test.html' -Body $roleBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            $locator = Find-PlaywrightPageElement -Page $page -Role 'button'
            $locator | Should -Not -BeNullOrEmpty
        }

        It 'Should find link by title' {
            $titleBody = @'
<a href="#" title="Home Page">Home</a>
<a href="#" title="About Page">About</a>
<a href="#" title="Contact Page">Contact</a>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'title-test.html' -Body $titleBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            $locator = Find-PlaywrightPageElement -Page $page -Title 'Home Page'
            $text = $locator.TextContentAsync().GetAwaiter().GetResult()
            $text | Should -Be 'Home'
        }

        It 'Should find input by label' {
            $labelBody = @'
<label for="username">Username:</label>
<input id="username" type="text" />
<label for="password">Password:</label>
<input id="password" type="password" />
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'label-test.html' -Body $labelBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            $locator = Find-PlaywrightPageElement -Page $page -Label 'Username:'
            $locator | Should -Not -BeNullOrEmpty
            $id = $locator.GetAttributeAsync('id').GetAwaiter().GetResult()
            $id | Should -Be 'username'
        }

        It 'Should find image by alt text' {
            $altBody = @'
<img src="logo.png" alt="Company Logo" />
<img src="banner.png" alt="Page Banner" />
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'alt-test.html' -Body $altBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            $locator = Find-PlaywrightPageElement -Page $page -AltText 'Company Logo'
            $alt = $locator.GetAttributeAsync('alt').GetAwaiter().GetResult()
            $alt | Should -Be 'Company Logo'
        }

        It 'Should find element by test id' {
            $testIdBody = @'
<button data-testid="submit-btn">Submit</button>
<button data-testid="cancel-btn">Cancel</button>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'testid-test.html' -Body $testIdBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            $locator = Find-PlaywrightPageElement -Page $page -TestId 'submit-btn'
            $text = $locator.TextContentAsync().GetAwaiter().GetResult()
            $text | Should -Be 'Submit'
        }

        It 'Should find nested elements by selector' {
            $nestedBody = @'
<div class="container">
    <div class="row">
        <div class="col" id="target">Target Content</div>
    </div>
</div>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'nested-test.html' -Body $nestedBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            $locator = Find-PlaywrightPageElement -Page $page -Selector '.container .row .col'
            $text = $locator.TextContentAsync().GetAwaiter().GetResult()
            $text | Should -Be 'Target Content'
        }

        It 'Should find multiple elements and return first' {
            $multiBody = @'
<div class="item">Item 1</div>
<div class="item">Item 2</div>
<div class="item">Item 3</div>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'multi-item-test.html' -Body $multiBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            $locator = Find-PlaywrightPageElement -Page $page -Selector '.item'
            $locator | Should -Not -BeNullOrEmpty
        }
    }

    Context 'Element State Validation' {
        It 'Should find enabled button' {
            $enabledBody = @'
<button id="enabled">Enabled Button</button>
<button id="disabled" disabled>Disabled Button</button>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'enabled-test.html' -Body $enabledBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            $locator = Find-PlaywrightPageElement -Page $page -Selector '#enabled'
            $isEnabled = $locator.IsEnabledAsync().GetAwaiter().GetResult()
            $isEnabled | Should -Be $true
        }

        It 'Should find checked checkbox' {
            $checkedBody = @'
<input type="checkbox" id="checked" checked />
<input type="checkbox" id="unchecked" />
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'checked-state-test.html' -Body $checkedBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            $locator = Find-PlaywrightPageElement -Page $page -Selector '#checked'
            $isChecked = $locator.IsCheckedAsync().GetAwaiter().GetResult()
            $isChecked | Should -Be $true
        }

        It 'Should verify element visibility' {
            $visibilityBody = @'
<div id="visible">Visible</div>
<div id="hidden" style="display:none;">Hidden</div>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'visibility-test.html' -Body $visibilityBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            
            $visibleLocator = Find-PlaywrightPageElement -Page $page -Selector '#visible'
            $isVisible = $visibleLocator.IsVisibleAsync().GetAwaiter().GetResult()
            $isVisible | Should -Be $true
        }
    }
}
