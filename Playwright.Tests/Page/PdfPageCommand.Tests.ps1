# Basic test for PdfPageCommand
Describe "PdfPageCommand" {
    It "Should generate PDF from page" {
    $browser = Start-PlaywrightBrowser
    $page = Open-PlaywrightPage -Browser $browser
    Set-PlaywrightPageContent -Html "<html><body><h1>PDF Test</h1></body></html>" -Page $page
    $pdfPath = "./test.pdf"
    Export-PlaywrightPagePdf -Page $page -Path $pdfPath
    Test-Path $pdfPath | Should -Be $true
    Remove-Item $pdfPath
    Stop-PlaywrightBrowser -Browser $browser
    }
}
