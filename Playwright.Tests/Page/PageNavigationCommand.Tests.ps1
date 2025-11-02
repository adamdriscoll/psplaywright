# Basic test for PageNavigationCommand
Describe "PageNavigationCommand" {
    It "Should navigate the page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Navigate-PlaywrightPage -Page $page -Url "https://example.com"
    $content = $page.ContentAsync().GetAwaiter().GetResult()
    $content | Should -Match "Example Domain"
    Stop-PlaywrightBrowser -Browser $browser
    }
}
