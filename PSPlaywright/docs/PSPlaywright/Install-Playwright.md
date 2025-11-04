---
document type: cmdlet
external help file: PSPlaywright-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Install-Playwright
---

# Install-Playwright

## SYNOPSIS

Installs Playwright and its required browser dependencies for use with PSPlaywright.

## SYNTAX

### __AllParameterSets

```
Install-Playwright
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Install-Playwright` to install the Playwright library and its browser dependencies. This command ensures that Playwright is ready for use in your automation scripts. It runs an internal installation script that downloads and sets up the required components.

## EXAMPLES

### Example 1


Install Playwright and its browsers:

```powershell
Install-Playwright
```

## PARAMETERS

## INPUTS

## OUTPUTS

### System.Object

Returns the result of the installation process. Typically, no output unless an error occurs.

## NOTES

This command should be run once before using other Playwright commands in a new environment.

## RELATED LINKS


See also:

- [Playwright Installation Guide](https://playwright.dev/dotnet/docs/intro#installation)

