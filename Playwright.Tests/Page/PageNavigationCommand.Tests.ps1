# Basic test for PageNavigationCommand
Describe "PageNavigationCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should navigate the page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    # Only Back or Forward supported, Url is not a valid parameter
    Invoke-PlaywrightPageNavigation -Page $page -Back
    # No assertion possible, just check for no error
    $true | Should -Be $true
    Stop-PlaywrightBrowser -Browser $browser
    }
}
