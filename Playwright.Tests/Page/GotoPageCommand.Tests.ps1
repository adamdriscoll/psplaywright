Describe 'Open-PlaywrightPageUrl' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\..\PSPlaywright\bin\Release\netstandard2.0\publish\PSPlaywright.psd1"
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    Context 'Parameter Validation' {
        It 'Should accept valid Url and load test file' {
            # Create a new HTML test file
            $testFilePath = New-BasicTestHtmlPage -FileName 'GotoPageTest.html' -Title 'Goto Test' -Body '<div id="test">Hello Playwright!</div>'
            # Start a new browser instance
            Start-PlaywrightBrowser -BrowserType 'chromium' -Enter
            Start-PlaywrightPage -Enter
            # Open the test file in the browser
            $result = Open-PlaywrightPageUrl -Url $testFilePath
            $result | Should -Not -BeNullOrEmpty
            # Optionally, validate page content
            $text = Invoke-PlaywrightLocatorText -Page $result -Selector '#test'
            $text | Should -Be 'Hello Playwright!'
        }
    }
}
