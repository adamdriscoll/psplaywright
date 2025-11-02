Import-Module "$PSScriptRoot/psplaywright.dll"

function Install-Playwright {
    $scriptPath = Join-Path $PSScriptRoot 'playwright.ps1'
    & $scriptPath install
}
