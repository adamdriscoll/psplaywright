Describe 'Find-PlaywrightPageElementCommand' {
    BeforeAll {
        Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1" -Force
        Start-Playwright
        $testFileName = 'FindPlaywrightPageElementTestContent.html'
        $testFilePath = Join-Path $PSScriptRoot $testFileName
        $htmlContent = Get-Content -Path $testFilePath -Raw
        New-TestHtmlFile -FileName $testFileName -HtmlContent $htmlContent | Out-Null
        $Server = Start-TestHttpServerInstance
        $pageUrl = Get-TestHtmlPageUrl -FileName $testFileName
        Start-PlaywrightBrowser -BrowserType 'chromium' -Enter
        $page = Open-PlaywrightPage -Url $pageUrl
    }
    AfterAll {
        Stop-Playwright
        Stop-TestHttpServer -Server $Server
        Remove-TestHtmlPagesFolder
    }
    Context 'Locator Info Properties' {
        It 'returns IsChecked property for checkbox' {
                $result = $page | Find-PlaywrightPageElement -Selector '#chk'
                $result.IsChecked | Should -Be $true
        }
        It 'returns IsDisabled property for disabled input' {
                $result = $page | Find-PlaywrightPageElement -Selector '#dis'
                $result.IsDisabled | Should -Be $true
        }
        It 'returns IsEditable property for editable input' {
                $result = $page | Find-PlaywrightPageElement -Selector '#edit'
                $result.IsEditable | Should -Be $true
        }
        It 'returns IsVisible property for visible div' {
                $result = $page | Find-PlaywrightPageElement -Selector '#vis'
                $result.IsVisible | Should -Be $true
        }
        It 'returns IsHidden property for hidden div' {
                $result = $page | Find-PlaywrightPageElement -Selector '#hid'
                $result.IsHidden | Should -Be $true
        }
        It 'returns Count property for multiple divs' {
            $result = $page | Find-PlaywrightPageElement -Selector '.test-multi-div > div'
            $result.Count | Should -Be 3
        }
        It 'returns InnerHTML property' {
                $result = $page | Find-PlaywrightPageElement -Selector '#vis'
                $result.InnerHTML | Should -Contain 'Visible'
        }
        It 'returns InnerText property' {
                $result = $page | Find-PlaywrightPageElement -Selector '#vis'
                $result.InnerText | Should -Be 'Visible'
        }
        It 'returns TextContent property' {
                $result = $page | Find-PlaywrightPageElement -Selector '#vis'
                $result.TextContent | Should -Be 'Visible'
        }
        It 'returns InputValue property for input' {
                $result = $page | Find-PlaywrightPageElement -Selector '#edit'
                $result.InputValue | Should -Be ''
        }
    }
}
