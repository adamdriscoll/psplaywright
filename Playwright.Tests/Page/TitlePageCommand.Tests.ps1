# Basic test for TitlePageCommand
Describe "TitlePageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should get the page title" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    $html = "<html><head><title>My Test Title</title></head><body></body></html>"
    Set-PlaywrightPageContent -Html $html -Page $page
    $title = Get-PlaywrightPageTitle -Page $page
    $title | Should -Be "My Test Title"
    Stop-PlaywrightBrowser -Browser $browser
    }
}
