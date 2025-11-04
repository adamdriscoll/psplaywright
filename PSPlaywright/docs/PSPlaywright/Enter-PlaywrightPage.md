---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Enter-PlaywrightPage
---

# Enter-PlaywrightPage

## SYNOPSIS

Enters a Playwright page, setting it as the active page context.

## SYNTAX

### __AllParameterSets

```
Enter-PlaywrightPage [-Page] <IPage> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Enter-PlaywrightPage` to set the specified Playwright page (`IPage`) as the active page context. This is useful for switching between multiple pages in your automation scripts.

## EXAMPLES

### Example 1


Set the active page context to a specific page instance:

```powershell
$page = Open-PlaywrightPage -Browser $browser
Enter-PlaywrightPage -Page $page
```

## PARAMETERS

### -Page

The Playwright page (`IPage`) instance to set as the active context.

```yaml
Type: Microsoft.Playwright.IPage
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

### Microsoft.Playwright.IPage

Accepts a Playwright `IPage` object as input.

## OUTPUTS

### System.Object

Returns the page object that was entered as the active context.

## NOTES

This command is useful for managing multiple page sessions in complex automation scenarios.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IPage](https://playwright.dev/dotnet/docs/api/class-page)
- [Playwright Documentation](https://playwright.dev/)

