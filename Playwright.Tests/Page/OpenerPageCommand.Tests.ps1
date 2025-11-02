# Basic test for OpenerPageCommand
Describe "OpenerPageCommand" {
    It "Should handle opener page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    # Pseudo: open a new page from the opener
    $newPage = $page.Context.NewPageAsync().GetAwaiter().GetResult()
    $opener = Get-PlaywrightPageOpener -Page $newPage
    $opener | Should -Be $page
    Stop-PlaywrightBrowser -Browser $browser
    }
}
