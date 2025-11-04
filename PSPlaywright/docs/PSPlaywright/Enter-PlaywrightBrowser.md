---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Enter-PlaywrightBrowser
---

# Enter-PlaywrightBrowser

## SYNOPSIS

Enters a Playwright browser instance, setting it as the active browser context.

## SYNTAX

### __AllParameterSets

```
Enter-PlaywrightBrowser [-Browser] <IBrowser> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Enter-PlaywrightBrowser` to set the specified Playwright browser (`IBrowser`) as the active browser context. This is useful for switching between multiple browser instances in your automation scripts.

## EXAMPLES

### Example 1


Set the active browser context to a specific browser instance:

```powershell
$browser = Start-PlaywrightBrowser -Type Chromium
Enter-PlaywrightBrowser -Browser $browser
```

## PARAMETERS

### -Browser

The Playwright browser (`IBrowser`) instance to set as the active context.

```yaml
Type: Microsoft.Playwright.IBrowser
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
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

Returns the result of entering the browser context. Typically, no output unless an error occurs.

## NOTES

This command is useful for managing multiple browser sessions in complex automation scenarios.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IBrowser](https://playwright.dev/dotnet/docs/api/class-browser)
- [Playwright Documentation](https://playwright.dev/)

