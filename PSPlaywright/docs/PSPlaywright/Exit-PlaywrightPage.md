---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Exit-PlaywrightPage
---

# Exit-PlaywrightPage

## SYNOPSIS

Exits the current Playwright page context, popping it from the context stack without closing the page.

## SYNTAX

### __AllParameterSets

```
Exit-PlaywrightPage [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Exit-PlaywrightPage` to remove the current page from the active context stack. This does not close the page, but allows you to switch back to a previous page context in your automation scripts.

## EXAMPLES

### Example 1


Exit the current page context:

```powershell
Exit-PlaywrightPage
```

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Object

Returns the page object that was exited from the active context, or a warning if no page was available.

## NOTES

This command is useful for managing multiple page sessions and switching contexts in complex automation scenarios.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IPage](https://playwright.dev/dotnet/docs/api/class-page)
- [Playwright Documentation](https://playwright.dev/)

