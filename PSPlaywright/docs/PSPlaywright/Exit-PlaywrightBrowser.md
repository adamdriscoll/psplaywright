---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Exit-PlaywrightBrowser
---

# Exit-PlaywrightBrowser

## SYNOPSIS

Exits the current Playwright browser context, popping it from the context stack without closing the browser.

## SYNTAX

### __AllParameterSets

```
Exit-PlaywrightBrowser [-Browser <IBrowser>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Exit-PlaywrightBrowser` to remove the current browser from the active context stack. This does not close the browser, but allows you to switch back to a previous browser context in your automation scripts.

## EXAMPLES

### Example 1


Exit the current browser context:

```powershell
Exit-PlaywrightBrowser -Browser $browser
```

## PARAMETERS

### -Browser

The Playwright browser (`IBrowser`) instance to exit from the context stack. If not provided, the current browser context is used.

```yaml
Type: Microsoft.Playwright.IBrowser
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Playwright.IBrowser

Accepts a Playwright `IBrowser` object as input.

## OUTPUTS

### System.Object

Returns the result of exiting the browser context. Typically, no output unless an error occurs.

## NOTES

This command is useful for managing multiple browser sessions and switching contexts in complex automation scenarios.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IBrowser](https://playwright.dev/dotnet/docs/api/class-browser)
- [Playwright Documentation](https://playwright.dev/)

