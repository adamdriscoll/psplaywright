Describe 'Find-PlaywrightPageElement' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
        Remove-TestHtmlPagesFolder
    }
    Context 'Parameter Validation and Element Finding' {
        It 'Should find element by AltText' {
            Start-TestHttpServerInstance | Out-Null
            $fileName = New-BasicTestHtmlPage -FileName 'AltTextTest.html' -Body '<img src="img.png" alt="TestAlt" />'
            Start-PlaywrightBrowser -BrowserType 'chromium' -Enter
            $url = Get-TestHtmlPageUrl -FileName $fileName
            $page = Open-PlaywrightPage -Url $url
            $element = Find-PlaywrightPageElement -AltText 'TestAlt' -Page $page
            $element | Should -Not -BeNullOrEmpty
        }
        It 'Should find element by Label' {
            $fileName = New-BasicTestHtmlPage -FileName 'LabelTest.html' -Body '<label for="input1">TestLabel</label><input id="input1" />'
            $url = Get-TestHtmlPageUrl -FileName $fileName
            $page = Open-PlaywrightPage -Url $url
            $element = Find-PlaywrightPageElement -Label 'TestLabel' -Page $page
            $element | Should -Not -BeNullOrEmpty
        }
        It 'Should find element by Role' {
            $fileName = New-BasicTestHtmlPage -FileName 'RoleTest.html' -Body '<button>ClickMe</button>'
            $url = Get-TestHtmlPageUrl -FileName $fileName
            $page = Open-PlaywrightPage -Url $url
            $element = Find-PlaywrightPageElement -Role 'button' -Page $page
            $element | Should -Not -BeNullOrEmpty
        }
        It 'Should throw on invalid Role' {
            $fileName = New-BasicTestHtmlPage -FileName 'InvalidRoleTest.html' -Body '<div>Test</div>'
            $url = Get-TestHtmlPageUrl -FileName $fileName
            $page = Open-PlaywrightPage -Url $url
            { Find-PlaywrightPageElement -Role 'notarole' -Page $page } | Should -Throw
        }
        It 'Should find element by TestId' {
            $fileName = New-BasicTestHtmlPage -FileName 'TestIdTest.html' -Body '<div data-testid="mytestid">TestIdDiv</div>'
            $url = Get-TestHtmlPageUrl -FileName $fileName
            $page = Open-PlaywrightPage -Url $url
            $element = Find-PlaywrightPageElement -TestId 'mytestid' -Page $page
            $element | Should -Not -BeNullOrEmpty
        }
        It 'Should find element by Text' {
            $fileName = New-BasicTestHtmlPage -FileName 'TextTest.html' -Body '<span>FindMe</span>'
            $url = Get-TestHtmlPageUrl -FileName $fileName
            $page = Open-PlaywrightPage -Url $url
            $element = Find-PlaywrightPageElement -Text 'FindMe' -Page $page
            $element | Should -Not -BeNullOrEmpty
        }
        It 'Should find element by Title' {
            $fileName = New-BasicTestHtmlPage -FileName 'TitleTest.html' -Body '<div title="MyTitle">TitleDiv</div>'
            $url = Get-TestHtmlPageUrl -FileName $fileName
            $page = Open-PlaywrightPage -Url $url
            $element = Find-PlaywrightPageElement -Title 'MyTitle' -Page $page
            $element | Should -Not -BeNullOrEmpty
        }
        It 'Should find element by Selector' {
            $fileName = New-BasicTestHtmlPage -FileName 'SelectorTest.html' -Body '<div class="myclass">SelectorDiv</div>'
            $url = Get-TestHtmlPageUrl -FileName $fileName
            $page = Open-PlaywrightPage -Url $url
            $element = Find-PlaywrightPageElement -Selector '.myclass' -Page $page
            $element | Should -Not -BeNullOrEmpty
        }
    }
}
