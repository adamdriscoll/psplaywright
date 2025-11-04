Describe 'Invoke-PlaywrightLocatorAdvanced' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $script:Server = Start-TestHttpServerInstance
        $script:browser = Start-PlaywrightBrowser -BrowserType 'chromium' -Headless
    }
    AfterAll {
        Stop-Playwright
        if ($script:Server) { Stop-TestHttpServer -Server $script:Server }
        Remove-TestHtmlPagesFolder
    }

    Context 'Screenshot Action' {
        It 'Should take a screenshot of a locator' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'screenshot-locator-test.html' -Body '<div id="target" style="width:200px;height:100px;background:red;">Target</div>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#target')
            $screenshotPath = Join-Path $env:TEMP 'locator-screenshot.png'
            
            $bytes = Invoke-PlaywrightLocatorAdvanced -Locator $locator -Screenshot -Path $screenshotPath
            Test-Path $screenshotPath | Should -Be $true
            
            # Clean up
            if (Test-Path $screenshotPath) { Remove-Item $screenshotPath -Force }
        }
    }

    Context 'ScrollIntoViewIfNeeded Action' {
        It 'Should scroll element into view' {
            $longPageBody = @'
<div style="height: 2000px;">Top content</div>
<div id="bottom" style="height: 100px; background: blue;">Bottom element</div>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'scroll-test.html' -Body $longPageBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#bottom')
            
            # Should not throw
            { Invoke-PlaywrightLocatorAdvanced -Locator $locator -ScrollIntoViewIfNeeded } | Should -Not -Throw
        }
    }

    Context 'WaitFor Action' {
        It 'Should wait for element to be visible' {
            $delayedVisibilityBody = @'
<div id="delayed" style="display:none;">Delayed Element</div>
<script>
    setTimeout(() => {
        document.getElementById('delayed').style.display = 'block';
    }, 500);
</script>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'waitfor-test.html' -Body $delayedVisibilityBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#delayed')
            
            # Should wait and not throw
            { Invoke-PlaywrightLocatorAdvanced -Locator $locator -WaitFor -State 'Visible' -Timeout 2000 } | Should -Not -Throw
        }
    }

    Context 'Evaluate Action' {
        It 'Should evaluate expression on locator' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'evaluate-test.html' -Body '<div id="evalTarget" data-value="123">Content</div>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#evalTarget')
            
            $result = Invoke-PlaywrightLocatorAdvanced -Locator $locator -Evaluate -Expression 'el => el.getAttribute("data-value")'
            $result | Should -Be '123'
        }

        It 'Should evaluate expression with argument' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'evaluate-arg-test.html' -Body '<div id="evalArg">Content</div>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#evalArg')
            
            $result = Invoke-PlaywrightLocatorAdvanced -Locator $locator -Evaluate -Expression '(el, arg) => arg + " world"' -EvalArg 'hello'
            $result | Should -Be 'hello world'
        }
    }

    Context 'SelectText Action' {
        It 'Should select text in element' {
            $TestPagePath = New-BasicTestHtmlPage -FileName 'selecttext-test.html' -Body '<textarea id="textArea">Select this text</textarea>'
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#textArea')
            
            # Should not throw
            { Invoke-PlaywrightLocatorAdvanced -Locator $locator -SelectText } | Should -Not -Throw
        }
    }

    Context 'DragTo Action' {
        It 'Should drag element to target' {
            $dragDropBody = @'
<div id="draggable" draggable="true" style="width:100px;height:100px;background:red;">Drag me</div>
<div id="droptarget" style="width:200px;height:200px;background:blue;margin-top:20px;">Drop here</div>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'dragdrop-test.html' -Body $dragDropBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $sourceLocator = $page.Locator('#draggable')
            $targetLocator = $page.Locator('#droptarget')
            
            # Should not throw
            { Invoke-PlaywrightLocatorAdvanced -Locator $sourceLocator -DragTo -TargetLocator $targetLocator } | Should -Not -Throw
        }
    }

    Context 'DispatchEvent Action' {
        It 'Should dispatch custom event' {
            $eventBody = @'
<div id="eventTarget">Target</div>
<script>
    document.getElementById('eventTarget').addEventListener('customEvent', (e) => {
        e.target.setAttribute('data-event-fired', 'true');
    });
</script>
'@
            $TestPagePath = New-BasicTestHtmlPage -FileName 'dispatch-event-test.html' -Body $eventBody
            $pageUrl = Get-TestHtmlPageUrl -FileName $TestPagePath
            $page = Open-PlaywrightPage -Browser $script:browser -Url $pageUrl
            $locator = $page.Locator('#eventTarget')
            
            Invoke-PlaywrightLocatorAdvanced -Locator $locator -DispatchEvent -EventType 'customEvent'
            
            $result = $locator.GetAttributeAsync('data-event-fired').GetAwaiter().GetResult()
            $result | Should -Be 'true'
        }
    }
}
