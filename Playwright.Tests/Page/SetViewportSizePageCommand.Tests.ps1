# Basic test for SetViewportSizePageCommand
Describe "SetViewportSizePageCommand" {
    It "Should set the viewport size" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Set-PlaywrightPageViewportSize -Page $page -Width 800 -Height 600
    $size = $page.ViewportSize
    $size.Width | Should -Be 800
    $size.Height | Should -Be 600
    Stop-PlaywrightBrowser -Browser $browser
    }
}
