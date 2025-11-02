function Start-TestHttpServer {
    param(
        [Parameter(Mandatory)]
        [string]$RootFolder,
        [int]$Port = 8080,
        [hashtable]$DefaultHeaders = @{}
    )

    $isGithubActions = $env:GITHUB_ACTIONS -eq 'true'
    if ($isGithubActions) {
        # Skip starting server in GitHub Actions
        return [PSCustomObject]@{
            Port = $Port
            RootFolder = $RootFolder
            JobId = $null
            Listener = $null
            Skipped = $true
        }
    }
    # ...existing code...
    $listener = [System.Net.HttpListener]::new()
    $listener.Prefixes.Add("http://localhost:$Port/")
    $listener.Start()

    if (-not (Get-Module -ListAvailable -Name ThreadJob)) {
        Import-Module ThreadJob -ErrorAction SilentlyContinue
    }
    $job = Start-ThreadJob -ScriptBlock {
        param($listener, $RootFolder, $DefaultHeaders)
        while ($listener.IsListening) {
            try {
                $context = $listener.GetContext()
                $request = $context.Request
                $response = $context.Response
                $urlPath = $request.Url.AbsolutePath.TrimStart('/')
                $filePath = Join-Path $RootFolder $urlPath
                if (Test-Path $filePath -PathType Leaf) {
                    $bytes = [System.IO.File]::ReadAllBytes($filePath)
                    $mimeType = $DefaultHeaders['Content-Type']
                    if (-not $mimeType) {
                        $ext = [System.IO.Path]::GetExtension($filePath)
                        switch ($ext) {
                            '.html' { $mimeType = 'text/html' }
                            '.txt'  { $mimeType = 'text/plain' }
                            '.json' { $mimeType = 'application/json' }
                            '.js'   { $mimeType = 'application/javascript' }
                            '.css'  { $mimeType = 'text/css' }
                            '.png'  { $mimeType = 'image/png' }
                            '.jpg'  { $mimeType = 'image/jpeg' }
                            '.jpeg' { $mimeType = 'image/jpeg' }
                            default { $mimeType = 'application/octet-stream' }
                        }
                    }
                    $response.ContentType = $mimeType
                    foreach ($key in $DefaultHeaders.Keys) {
                        $response.Headers[$key] = $DefaultHeaders[$key]
                    }
                    $response.OutputStream.Write($bytes, 0, $bytes.Length)
                } else {
                    $response.StatusCode = 404
                    $response.ContentType = 'text/plain'
                    $msg = "File not found: $urlPath"
                    $bytes = [System.Text.Encoding]::UTF8.GetBytes($msg)
                    $response.OutputStream.Write($bytes, 0, $bytes.Length)
                }
                $response.Close()
            } catch {
                # Ignore errors, continue
            }
        }
    } -ArgumentList $listener, $RootFolder, $DefaultHeaders

    return [PSCustomObject]@{
        Port = $Port
        RootFolder = $RootFolder
        JobId = $job.Id
        Listener = $listener
        Skipped = $false
    }
}

function Stop-TestHttpServer {
    param(
        [Parameter(Mandatory)]
        [object]$ServerInfo
    )
    $isGithubActions = $env:GITHUB_ACTIONS -eq 'true'
    if ($isGithubActions -or $ServerInfo.Skipped) {
        # Skip stopping server in GitHub Actions or if server was not started
        return
    }
    # ...existing code...
    $ServerInfo.Listener.Stop()
    $job = Get-Job -Id $ServerInfo.JobId
    if ($job) {
        Stop-Job -Id $job.Id
        Remove-Job -Id $job.Id
    }

}
