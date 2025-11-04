---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Invoke-PlaywrightPageJavascript
---

# Invoke-PlaywrightPageJavascript

## SYNOPSIS

Invokes a JavaScript expression on a Playwright page and returns the result.

## SYNTAX

### __AllParameterSets

```
Invoke-PlaywrightPageJavascript [-Expression] <string> [[-Argument] <Object>] [-Page <IPage>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Invoke-PlaywrightPageJavascript` to evaluate a JavaScript expression on a Playwright page. You can pass an optional argument to the expression. The result of the evaluation is returned to PowerShell.

## EXAMPLES

### Example 1


Evaluate a JavaScript expression on the page:

```powershell
$result = Invoke-PlaywrightPageJavascript -Expression "document.title" -Page $page
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

Returns the result of the JavaScript evaluation.

## NOTES

This command is useful for advanced page interactions and extracting data from the DOM.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IPage.EvaluateAsync](https://playwright.dev/dotnet/docs/api/class-page#pageevaluate)
- [Playwright Documentation](https://playwright.dev/)

