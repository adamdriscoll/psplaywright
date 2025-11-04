---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Get-PlaywrightPageTitle
---

# Get-PlaywrightPageTitle

## SYNOPSIS

Gets the title of the current Playwright page.

## SYNTAX

### __AllParameterSets

```
Get-PlaywrightPageTitle [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Get-PlaywrightPageTitle` to retrieve the title of the current Playwright page. This is useful for validation, reporting, or debugging in automated tests.

## EXAMPLES

### Example 1


Get the title of the current page:

```powershell
$title = Get-PlaywrightPageTitle -Page $page
```

## PARAMETERS

### -Page

Specifies the Playwright page (`IPage`) to get the title from. If not provided, the current page context is used.

```yaml
Type: Microsoft.Playwright.IPage
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

### Microsoft.Playwright.IPage

Accepts a Playwright `IPage` object as input.

## OUTPUTS

### System.Object

Returns the title of the page as a string.

## NOTES

This command is useful for validating page navigation and content in automated UI tests.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IPage.TitleAsync](https://playwright.dev/dotnet/docs/api/class-page#pagetitle)
- [Playwright Documentation](https://playwright.dev/)

