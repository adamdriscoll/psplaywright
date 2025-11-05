Import-Module "$PSScriptRoot/psplaywright.dll"

function Install-Playwright {
    [CmdletBinding()]
    param(
        [switch]$SkipNodeInstall
    )
    
    # Check if Node.js is installed
    $nodeInstalled = $false
    try {
        $nodeVersion = node --version 2>$null
        if ($nodeVersion) {
            Write-Verbose "Node.js is already installed: $nodeVersion"
            $nodeInstalled = $true
        }
    }
    catch {
        Write-Verbose "Node.js not found in PATH"
    }
    
    # Install Node.js if not present and not skipped
    if (-not $nodeInstalled -and -not $SkipNodeInstall) {
        Write-Verbose "Node.js is required for Playwright. Installing Node.js..."
        
        if ($IsWindows -or $PSVersionTable.PSEdition -eq 'Desktop') {
            # Windows installation using winget or chocolatey
            try {
                # Try winget first (available on Windows 10 1809+)
                $wingetPath = Get-Command winget -ErrorAction SilentlyContinue
                if ($wingetPath) {
                    Write-Verbose "Installing Node.js using winget..."
                    winget install OpenJS.NodeJS.LTS --silent --accept-source-agreements --accept-package-agreements
                }
                else {
                    # Fall back to chocolatey if available
                    $chocoPath = Get-Command choco -ErrorAction SilentlyContinue
                    if ($chocoPath) {
                        Write-Verbose "Installing Node.js using Chocolatey..."
                        choco install nodejs-lts -y
                    }
                    else {
                        Write-Warning "Neither winget nor Chocolatey found. Please install Node.js manually from https://nodejs.org/"
                        Write-Warning "After installing Node.js, restart your PowerShell session and run Install-Playwright again."
                        return
                    }
                }
            }
            catch {
                Write-Error "Failed to install Node.js: $_"
                Write-Warning "Please install Node.js manually from https://nodejs.org/"
                return
            }
        }
        elseif ($IsMacOS) {
            # macOS installation using Homebrew
            try {
                $brewPath = Get-Command brew -ErrorAction SilentlyContinue
                if ($brewPath) {
                    Write-Verbose "Installing Node.js using Homebrew..."
                    brew install node
                }
                else {
                    Write-Warning "Homebrew not found. Please install Node.js manually from https://nodejs.org/"
                    Write-Warning "Or install Homebrew first: /bin/bash -c `$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                    return
                }
            }
            catch {
                Write-Error "Failed to install Node.js: $_"
                Write-Warning "Please install Node.js manually from https://nodejs.org/"
                return
            }
        }
        elseif ($IsLinux) {
            # Linux installation using apt, yum, or dnf
            try {
                # Detect package manager
                if (Get-Command apt-get -ErrorAction SilentlyContinue) {
                    Write-Verbose "Installing Node.js using apt..."
                    sudo apt-get update
                    sudo apt-get install -y nodejs npm
                }
                elseif (Get-Command dnf -ErrorAction SilentlyContinue) {
                    Write-Verbose "Installing Node.js using dnf..."
                    sudo dnf install -y nodejs npm
                }
                elseif (Get-Command yum -ErrorAction SilentlyContinue) {
                    Write-Verbose "Installing Node.js using yum..."
                    sudo yum install -y nodejs npm
                }
                else {
                    Write-Warning "No supported package manager found. Please install Node.js manually."
                    Write-Warning "Visit https://nodejs.org/ or use your distribution's package manager."
                    return
                }
            }
            catch {
                Write-Error "Failed to install Node.js: $_"
                Write-Warning "Please install Node.js manually from https://nodejs.org/"
                return
            }
        }
        
        # Verify Node.js installation
        try {
            $nodeVersion = node --version 2>$null
            if ($nodeVersion) {
                Write-Verbose "Node.js successfully installed: $nodeVersion"
            }
            else {
                Write-Warning "Node.js installation completed, but 'node' command not found."
                Write-Warning "Please restart your PowerShell session and run Install-Playwright again."
                return
            }
        }
        catch {
            Write-Warning "Node.js installation completed, but 'node' command not found in PATH."
            Write-Warning "Please restart your PowerShell session and run Install-Playwright again."
            return
        }
    }
    elseif (-not $nodeInstalled -and $SkipNodeInstall) {
        Write-Error "Node.js is not installed and -SkipNodeInstall was specified. Playwright requires Node.js to function."
        Write-Warning "Please install Node.js from https://nodejs.org/ or run Install-Playwright without -SkipNodeInstall"
        return
    }
    
    # Install Playwright browsers using npx
    Write-Verbose "Installing Playwright browsers..."
    try {
        # Use npx to run playwright install command
        $playwrightInstallCmd = "$PSScriptRoot\playwright.ps1 install"
        
        Write-Verbose "Executing: $playwrightInstallCmd"
        $result = & $playwrightInstallCmd
        
        Write-Verbose "Playwright browsers installed successfully!"
        Write-Output $result
    }
    catch {
        Write-Error "Failed to install Playwright browsers: $_"
        Write-Warning "You may need to install Playwright manually using: $PSScriptRoot\playwright.ps1 install"
    }
}
