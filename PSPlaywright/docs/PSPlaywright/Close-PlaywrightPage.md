---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Close-PlaywrightPage
---

# Close-PlaywrightPage

## SYNOPSIS

Closes a Playwright page, releasing resources and ending the browser tab or window.

## SYNTAX

### __AllParameterSets

```
Close-PlaywrightPage [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Close-PlaywrightPage` to close a Playwright page (tab or window) in the browser. This command is useful for cleaning up after tests or when you need to programmatically close a page.

## EXAMPLES

### Example 1


Close the current Playwright page:

```powershell
Close-PlaywrightPage -Page $page
```

## PARAMETERS

### -Page

Specifies the Playwright page (`IPage`) to close. If not provided, the current page context is used.

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

Returns the result of the page close operation. Typically, no output unless an error occurs.

## NOTES

This command is useful for cleaning up browser resources and ending sessions in automated tests.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IPage.CloseAsync](https://playwright.dev/dotnet/docs/api/class-page#pageclose)
- [Playwright Documentation](https://playwright.dev/)

