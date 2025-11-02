

function New-TestHtmlFile {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$FileName,
        [Parameter(Mandatory)]
        [string]$HtmlContent,
        [string]$OutputDirectory = (Join-Path $PSScriptRoot 'TestPages')
    )
    if (!(Test-Path $OutputDirectory)) {
        New-Item -ItemType Directory -Path $OutputDirectory | Out-Null
    }
    $filePath = Join-Path $OutputDirectory $FileName
    Set-Content -Path $filePath -Value $HtmlContent -Encoding UTF8
    return $filePath
}

function New-BasicTestHtmlPage {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$FileName,
        [string]$Title = 'Test Page',
        [string]$Body = '<div>Test Content</div>',
        [string]$OutputDirectory = (Join-Path $PSScriptRoot 'TestPages')
    )
    $html = @"
<!DOCTYPE html>
<html>
<head>
    <title>$Title</title>
</head>
<body>
    $Body
</body>
</html>
"@
    return New-TestHtmlFile -FileName $FileName -HtmlContent $html -OutputDirectory $OutputDirectory
}

function Remove-TestHtmlPagesFolder {
    [CmdletBinding()]
    param(
        [string]$TargetDirectory = (Join-Path $PSScriptRoot 'TestPages')
    )
    if (Test-Path $TargetDirectory) {
        try {
            Remove-Item -Path $TargetDirectory -Recurse -Force
            Write-Verbose "Removed folder: $TargetDirectory"
            return $true
        }
        catch {
            Write-Warning "Failed to remove folder: $TargetDirectory. $_"
            return $false
        }
    }
    else {
        Write-Verbose "Folder does not exist: $TargetDirectory"
        return $false
    }
}
