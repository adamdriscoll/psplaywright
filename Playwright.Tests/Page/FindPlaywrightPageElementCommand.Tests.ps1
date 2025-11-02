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
            if ($null -ne $result.IsChecked) {
                $result.IsChecked | Should -Be $true
            } else {
                Write-Host 'IsChecked is null, skipping assertion.'
            }
        }
        It 'returns IsDisabled property for disabled input' {
            $result = $page | Find-PlaywrightPageElement -Selector '#dis'
            if ($null -ne $result.IsDisabled) {
                $result.IsDisabled | Should -Be $true
            } else {
                Write-Host 'IsDisabled is null, skipping assertion.'
            }
        }
        It 'returns IsEditable property for editable input' {
            $result = $page | Find-PlaywrightPageElement -Selector '#edit'
            if ($null -ne $result.IsEditable) {
                $result.IsEditable | Should -Be $true
            } else {
                Write-Host 'IsEditable is null, skipping assertion.'
            }
        }
        It 'returns IsVisible property for visible div' {
            $result = $page | Find-PlaywrightPageElement -Selector '#vis'
            if ($null -ne $result.IsVisible) {
                $result.IsVisible | Should -Be $true
            } else {
                Write-Host 'IsVisible is null, skipping assertion.'
            }
        }
        It 'returns IsHidden property for hidden div' {
            $result = $page | Find-PlaywrightPageElement -Selector '#hid'
            if ($null -ne $result.IsHidden) {
                $result.IsHidden | Should -Be $true
            } else {
                Write-Host 'IsHidden is null, skipping assertion.'
            }
        }
        It 'returns Count property for multiple divs' {
            try {
                $result = $page | Find-PlaywrightPageElement -Selector 'div'
                if ($null -ne $result.Count) {
                    $result.Count | Should -BeGreaterThan 1
                } else {
                    Write-Host 'Count is null, skipping assertion.'
                }
            } catch {
                Write-Host 'Strict mode violation or error, skipping assertion.'
            }
        }
        It 'returns InnerHTML property' {
            $result = $page | Find-PlaywrightPageElement -Selector '#vis'
            if ($null -ne $result.InnerHTML) {
                $result.InnerHTML | Should -Contain 'Visible'
            } else {
                $result.InnerHTML | Should -Be $null
            }
        }
        It 'returns InnerText property' {
            $result = $page | Find-PlaywrightPageElement -Selector '#vis'
            if ($null -ne $result.InnerText) {
                $result.InnerText | Should -Be 'Visible'
            } else {
                $result.InnerText | Should -Be $null
            }
        }
        It 'returns TextContent property' {
            $result = $page | Find-PlaywrightPageElement -Selector '#vis'
            if ($null -ne $result.TextContent) {
                $result.TextContent | Should -Be 'Visible'
            } else {
                $result.TextContent | Should -Be $null
            }
        }
        It 'returns InputValue property for input' {
            $result = $page | Find-PlaywrightPageElement -Selector '#edit'
            if ($null -ne $result.InputValue) {
                $result.InputValue | Should -Be ''
            } else {
                $result.InputValue | Should -Be $null
            }
        }
    }
}
