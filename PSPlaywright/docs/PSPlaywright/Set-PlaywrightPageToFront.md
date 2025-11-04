---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Set-PlaywrightPageToFront
---

# Set-PlaywrightPageToFront

## SYNOPSIS

Brings the page tab to the front (activates the tab).

## SYNTAX

### __AllParameterSets

```
Set-PlaywrightPageToFront [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Set-PlaywrightPageToFront cmdlet brings the current page tab to the front, making it the active tab in the browser. This is useful when working with multiple tabs or windows.

## EXAMPLES

### Example 1: Bring page to front

```powershell
Set-PlaywrightPageToFront
```

Activates the current page tab, bringing it to the front.

## PARAMETERS

### -Page

The page object to perform the operation on. If not specified, uses the page from the current context.

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

You can pipe a page object to this cmdlet.

## OUTPUTS

### System.Object

This cmdlet does not return any output.

## NOTES

- This is particularly useful when automating scenarios with multiple tabs or windows.
- The page will become the active/focused tab in the browser.

## RELATED LINKS

[Open-PlaywrightPage](Open-PlaywrightPage.md)

