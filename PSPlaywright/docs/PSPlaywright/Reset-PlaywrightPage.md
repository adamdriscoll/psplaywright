---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Reset-PlaywrightPage
---

# Reset-PlaywrightPage

## SYNOPSIS

Reloads the current page in the browser.

## SYNTAX

### __AllParameterSets

```
Reset-PlaywrightPage [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Reset-PlaywrightPage cmdlet reloads the current page in the browser, similar to pressing the refresh button. This is useful when you need to reset the page state or load updated content.

## EXAMPLES

### Example 1: Reload the current page

```powershell
Reset-PlaywrightPage
```

Reloads the current page in the browser.

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

- This cmdlet waits for the page to fully reload before returning.
- Any unsaved data on the page will be lost.

## RELATED LINKS

[Open-PlaywrightPageUrl](Open-PlaywrightPageUrl.md)

