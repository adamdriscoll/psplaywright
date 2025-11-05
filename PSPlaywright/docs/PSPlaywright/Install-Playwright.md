---
document type: cmdlet
external help file: PSPlaywright-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/05/2025
PlatyPS schema version: 2024-05-01
title: Install-Playwright
---

# Install-Playwright

## SYNOPSIS

Installs Playwright and its required browser dependencies for use with PSPlaywright.

## SYNTAX

### __AllParameterSets

```
Install-Playwright [-SkipNodeInstall]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Install-Playwright` to install the Playwright library and its browser dependencies. This command ensures that Playwright is ready for use in your automation scripts. It runs an internal installation script that downloads and sets up the required components.

The command automatically checks if Node.js is installed and will attempt to install it if missing (unless `-SkipNodeInstall` is specified). The installation method is platform-specific:

- **Windows**: Uses winget (preferred) or Chocolatey
- **macOS**: Uses Homebrew
- **Linux**: Uses apt, dnf, or yum depending on the distribution

After ensuring Node.js is available, the command uses `npx playwright install` to download the Chromium, Firefox, and WebKit browser binaries.

## EXAMPLES

### Example 1: Install Playwright with automatic Node.js installation

Install Playwright and automatically install Node.js if needed:

```powershell
Install-Playwright
```

### Example 2: Install Playwright without Node.js auto-installation

Install Playwright browsers only, assuming Node.js is already installed:

```powershell
Install-Playwright -SkipNodeInstall
```

## PARAMETERS

### -SkipNodeInstall

Skip the automatic Node.js installation check and installation. Use this parameter if you have Node.js installed but want to bypass the check, or if you prefer to install Node.js manually.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### None

## OUTPUTS

### System.Object

Returns the result of the installation process. Typically, no output unless an error occurs.

## NOTES

- This command should be run once before using other Playwright commands in a new environment.
- Node.js is required for Playwright to function. The command will attempt to install it automatically on first run.
- Supported package managers:
  - Windows: winget, Chocolatey
  - macOS: Homebrew
  - Linux: apt, dnf, yum
- If automatic Node.js installation fails, you can install it manually from <https://nodejs.org/>

## RELATED LINKS

- [Playwright Documentation](https://playwright.dev/)
- [Node.js Downloads](https://nodejs.org/)


See also:

- [Playwright Installation Guide](https://playwright.dev/dotnet/docs/intro#installation)

