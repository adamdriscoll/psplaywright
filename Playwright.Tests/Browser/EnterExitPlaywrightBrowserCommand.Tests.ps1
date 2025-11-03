Describe 'Enter-PlaywrightBrowser and Exit-PlaywrightBrowser' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
    $testFileName = 'FindPlaywrightPageElementTestContent.html'
    $testFilePath = Join-Path $PSScriptRoot '..\Page' | Join-Path -ChildPath $testFileName
    $htmlContent = Get-Content -Path $testFilePath -Raw
    New-TestHtmlFile -FileName $testFileName -HtmlContent $htmlContent | Out-Null
        $Server = Start-TestHttpServerInstance
        $pageUrl = Get-TestHtmlPageUrl -FileName $testFileName
        $browser1 = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
        $browser2 = Start-PlaywrightBrowser -BrowserType 'firefox' -Headless
    }
    AfterAll {
        Stop-Playwright
        Stop-TestHttpServer -Server $Server
        Remove-TestHtmlPagesFolder
    }
    It 'Should enter first browser and assert page element' {
        Enter-PlaywrightBrowser -Browser $browser1
        $page1 = Open-PlaywrightPage -Url $pageUrl
        $result1 = $page1 | Find-PlaywrightPageElement -Selector '#vis'
        $result1.IsVisible | Should -Be $true
        Exit-PlaywrightBrowser
    }
    It 'Should enter second browser and assert page element' {
        Enter-PlaywrightBrowser -Browser $browser2
        $page2 = Open-PlaywrightPage -Url $pageUrl
        $result2 = $page2 | Find-PlaywrightPageElement -Selector '#hid'
        $result2.IsHidden | Should -Be $true
        Exit-PlaywrightBrowser
    }
    It 'Should exit both browsers and have no active browser' {
        # After exiting both, trying to open a page should fail
        { Open-PlaywrightPage -Url $pageUrl } | Should -Throw
    }
}
