---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Get-PlaywrightPageJavascriptHandle
---

# Get-PlaywrightPageJavascriptHandle

## SYNOPSIS

Gets a handle to a JavaScript object or value on a Playwright page by evaluating an expression.

## SYNTAX

### __AllParameterSets

```
Get-PlaywrightPageJavascriptHandle [-Expression] <string> [[-Argument] <Object>] [-Page <IPage>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Get-PlaywrightPageJavascriptHandle` to evaluate a JavaScript expression on a Playwright page and return a handle to the resulting object or value. This is useful for interacting with complex objects or DOM nodes in automated tests.

## EXAMPLES

### Example 1


Get a handle to the document body:

```powershell
$handle = Get-PlaywrightPageJavascriptHandle -Expression "document.body" -Page $page
```

Get a handle to a custom object:

```powershell
$handle = Get-PlaywrightPageJavascriptHandle -Expression "window.myObject" -Page $page
```

## PARAMETERS

### -Argument

An optional argument to pass to the evaluated JavaScript expression.

```yaml
Type: System.Object
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Expression

The JavaScript expression to evaluate on the page. Required.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Page

Specifies the Playwright page (`IPage`) to evaluate the expression on. If not provided, the current page context is used.

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

Returns a handle to the JavaScript object or value as a Playwright handle object.

## NOTES

This command is useful for advanced interactions with page objects and DOM nodes.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IPage.EvaluateHandleAsync](https://playwright.dev/dotnet/docs/api/class-page#pageevaluatehandle)
- [Playwright Documentation](https://playwright.dev/)

