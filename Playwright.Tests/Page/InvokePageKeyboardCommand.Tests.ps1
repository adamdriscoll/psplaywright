
Describe 'Invoke-PlaywrightPageKeyboard' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Import-Module "$PSScriptRoot\..\TestHttpServer.psm1"
        Start-Playwright
        $TestPagesDir = Join-Path $PSScriptRoot '..\TestPages'
        $server = Start-TestHttpServer -RootFolder $TestPagesDir -Port 9999
        $global:testServer = $server
    }
    AfterAll {
        Stop-Playwright
        if ($global:testServer) { Stop-TestHttpServer -ServerInfo $global:testServer }
        Remove-TestHtmlPagesFolder
    }
    Context 'Keyboard Actions' {
        It 'Should type text into input using keyboard' {
            $testFilePath = New-BasicTestHtmlPage -FileName 'KeyboardTest.html' -Title 'Keyboard Test' -Body '<input id="input" />'
            Start-PlaywrightBrowser -BrowserType 'chromium' -Enter
            $url = "http://localhost:9999/KeyboardTest.html"
            $page = Open-PlaywrightPage -Url $url
            # Focus the input
            $page.Locator('#input').ClickAsync().GetAwaiter().GetResult()
            # Type text
            Invoke-PlaywrightPageKeyboard -Page $page -Text 'Hello World'
            $value = Invoke-PlaywrightPageJavascript -Page $page -Expression 'document.getElementById("input").value'
            $value | Should -Be 'Hello World'
        }
        It 'Should press, down, up, and insert text using keyboard' {
            $testFilePath = New-BasicTestHtmlPage -FileName 'KeyboardTest2.html' -Title 'Keyboard Test 2' -Body '<input id="input2" />'
            Start-PlaywrightBrowser -BrowserType 'chromium' -Enter
            $url = "http://localhost:9999/KeyboardTest2.html"
            $page = Open-PlaywrightPage -Url $url
            $page.Locator('#input2').ClickAsync().GetAwaiter().GetResult()
            # Insert text
            Invoke-PlaywrightPageKeyboard -Page $page -InsertText 'abc'
            $value = Invoke-PlaywrightPageJavascript -Page $page -Expression 'document.getElementById("input2").value'
            $value | Should -Be 'abc'
            # Press key
            Invoke-PlaywrightPageKeyboard -Page $page -Key 'A'
            # Down and Up key
            Invoke-PlaywrightPageKeyboard -Page $page -DownKey 'Shift'
            Invoke-PlaywrightPageKeyboard -Page $page -UpKey 'Shift'
            # Validate input still present
            $value2 = Invoke-PlaywrightPageJavascript -Page $page -Expression 'document.getElementById("input2").value'
            $value2 | Should -Be 'abcA'
        }
    }
}
