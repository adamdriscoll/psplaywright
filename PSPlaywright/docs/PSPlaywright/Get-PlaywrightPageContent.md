---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Get-PlaywrightPageContent
---

# Get-PlaywrightPageContent

## SYNOPSIS

Gets the HTML content of a Playwright page.

## SYNTAX

### __AllParameterSets

```
Get-PlaywrightPageContent [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Get-PlaywrightPageContent` to retrieve the full HTML content of the current Playwright page. This is useful for inspecting the DOM, debugging, or extracting page markup in automated tests.

## EXAMPLES

### Example 1


Get the HTML content of the current page:

```powershell
$html = Get-PlaywrightPageContent -Page $page
```

## PARAMETERS

### -Page

Specifies the Playwright page (`IPage`) to get the content from. If not provided, the current page context is used.

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

Returns the HTML content of the page as a string.

## NOTES

This command is useful for extracting or inspecting the DOM in automated UI tests.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IPage.ContentAsync](https://playwright.dev/dotnet/docs/api/class-page#pagecontent)
- [Playwright Documentation](https://playwright.dev/)

