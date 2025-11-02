Describe 'Invoke-PlaywrightLocatorClick' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
        # Create a test HTML page with a #submit element
        $TestPagePath = New-BasicTestHtmlPage -FileName 'invoke-locator-click-test.html' -Body '<button id="submit">Submit</button>'
    }
    AfterAll {
        Stop-Playwright
        Remove-TestHtmlPagesFolder
    }
    Context 'Parameter Validation' {
        It 'Should accept valid Locator' {
            $fileUrl = "file:///$($TestPagePath -replace '\\','/')"
            $page = Open-PlaywrightPage -Browser $browser -Url $fileUrl
            $locator = $page.Locator('#submit')
            $result = Invoke-PlaywrightLocatorClick -Locator $locator
            $result | Should -BeNullOrEmpty # Assert cmdlet returns nothing on success
        }
    }
}
