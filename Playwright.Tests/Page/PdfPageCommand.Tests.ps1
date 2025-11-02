# Basic test for PdfPageCommand
Describe "PdfPageCommand" {
    BeforeAll {
    Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
        Start-Playwright
    }
    AfterAll {
        Stop-Playwright
    }
    It "Should generate PDF from page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Set-PlaywrightPageContent -Html "<html><body><h1>PDF Test</h1></body></html>" -Page $page
    $pdfPath = "./test.pdf"
    Get-PlaywrightPagePdf -Page $page -Path $pdfPath
    Test-Path $pdfPath | Should -Be $true
    Remove-Item $pdfPath
    Stop-PlaywrightBrowser -Browser $browser
    }
}
