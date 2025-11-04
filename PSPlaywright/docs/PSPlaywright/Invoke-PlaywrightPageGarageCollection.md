---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Invoke-PlaywrightPageGarageCollection
---

# Invoke-PlaywrightPageGarageCollection

## SYNOPSIS

Requests garbage collection on the page to free up memory.

## SYNTAX

### __AllParameterSets

```
Invoke-PlaywrightPageGarageCollection [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Invoke-PlaywrightPageGarageCollection cmdlet requests garbage collection on the current page. This can help free up memory during long-running automation sessions.

## EXAMPLES

### Example 1: Request garbage collection

```powershell
Invoke-PlaywrightPageGarageCollection
```

Requests garbage collection on the current page.

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

- This is typically used in long-running automation scenarios to manage memory usage.
- Garbage collection is requested but not guaranteed to occur immediately.

## RELATED LINKS

[Open-PlaywrightPage](Open-PlaywrightPage.md)

