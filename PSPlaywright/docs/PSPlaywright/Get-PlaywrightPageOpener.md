---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Get-PlaywrightPageOpener
---

# Get-PlaywrightPageOpener

## SYNOPSIS

Gets the opener page for a Playwright page, if it was opened by another page.

## SYNTAX

### __AllParameterSets

```
Get-PlaywrightPageOpener [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Get-PlaywrightPageOpener` to retrieve the page that opened the current Playwright page, if available. This is useful for tracking navigation flows or parent-child page relationships in automated tests.

## EXAMPLES

### Example 1


Get the opener page for the current page:

```powershell
$opener = Get-PlaywrightPageOpener -Page $page
```

## PARAMETERS

### -Page

Specifies the Playwright page (`IPage`) to get the opener for. If not provided, the current page context is used.

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

Returns the opener page object, or `$null` if there is no opener.

## NOTES

This command is useful for handling popups and navigation flows in browser automation.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IPage.OpenerAsync](https://playwright.dev/dotnet/docs/api/class-page#pageopener)
- [Playwright Documentation](https://playwright.dev/)

