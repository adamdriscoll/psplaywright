Describe 'Set-PlaywrightLocatorInput' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $Server = Start-TestHttpServerInstance 
    }
    AfterAll {
        Stop-Playwright
        Stop-TestHttpServer -Server $Server
    }
    Context 'Parameter Validation' {
        It 'Should accept valid Locator and Value' {
            
            $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
            $TestPagePath = New-BasicTestHtmlPage -FileName 'set-locator-input-test.html' -Body '<input id="username" />'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $browser -Url $pageUrl
            $locator = $page.Locator('#username')
            Set-PlaywrightLocatorInput -Locator $locator -Value 'testuser'
            $value = Invoke-PlaywrightPageJavascript -Page $page -Expression 'document.getElementById("username").value'
            $value | Should -Be 'testuser'
        }
    }
}
