# Basic test for InvokePageKeyboardCommand
Describe "InvokePageKeyboardCommand" {
    It "Should invoke keyboard actions on page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Set-PlaywrightPageContent -Html "<html><body><input id='input' /></body></html>" -Page $page
    Invoke-PlaywrightPageKeyboard -Page $page -Action "Type" -Text "Hello"
    $value = $page.EvaluateAsync("() => document.getElementById('input').value").GetAwaiter().GetResult()
    $value | Should -Be "Hello"
    Stop-PlaywrightBrowser -Browser $browser
    }
}
