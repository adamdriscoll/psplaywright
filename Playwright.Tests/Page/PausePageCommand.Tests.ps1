# Basic test for PausePageCommand
Describe "PausePageCommand" {
    It "Should pause the page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Pause-PlaywrightPage -Page $page
    # Pseudo check: no error thrown
    $true | Should -Be $true
    Stop-PlaywrightBrowser -Browser $browser
    }
}
