---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Stop-Playwright
---

# Stop-Playwright

## SYNOPSIS

Stops and disposes of the Playwright instance and cleans up resources.

## SYNTAX

### __AllParameterSets

```
Stop-Playwright [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Stop-Playwright cmdlet stops the Playwright instance in the current context and cleans up all associated resources. This should be called when you're finished with browser automation to properly dispose of resources.

## EXAMPLES

### Example 1: Stop Playwright

```powershell
Stop-Playwright
```

This command stops the Playwright instance in the current context and releases all resources.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Void

This cmdlet does not return any output.

## NOTES

- This cmdlet will throw an error if no Playwright instance is found in the current context.
- Always call this cmdlet when you're done with browser automation to ensure proper resource cleanup.
- Any open browsers should be closed before calling this cmdlet.

## RELATED LINKS

[Start-Playwright](Start-Playwright.md)
[Stop-PlaywrightBrowser](Stop-PlaywrightBrowser.md)

