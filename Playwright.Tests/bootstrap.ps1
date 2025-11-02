# Bootstrap script for PSPlaywright functional test execution
# Installs Pester, ensures Playwright browsers are installed, and runs all tests

# Install Pester if not present
if (-not (Get-Module -ListAvailable -Name Pester)) {
    Write-Host "Installing Pester..."
    Install-Module Pester -Force -SkipPublisherCheck
}

# Install Playwright browsers using PSPlaywright
Write-Host "Ensuring Playwright browsers are installed..."
Import-Module "$PSScriptRoot/../PSPlaywright/PSPlaywright.psm1"
Install-Playwright

# Run all Pester tests in Playwright.Tests
Write-Host "Running Pester tests..."
Invoke-Pester -Path "$PSScriptRoot" -Output Detailed
