---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Get-PlaywrightPageScreenshot
---

# Get-PlaywrightPageScreenshot

## SYNOPSIS

Captures a screenshot of the current Playwright page and saves it to the specified path.

## SYNTAX

### __AllParameterSets

```
Get-PlaywrightPageScreenshot [-Path] <string> [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Get-PlaywrightPageScreenshot` to capture a screenshot of the current Playwright page. Specify the output path for the image file. This is useful for visual regression testing, reporting, or archiving page states.

## EXAMPLES

### Example 1


Save a screenshot of the current page:

```powershell
Get-PlaywrightPageScreenshot -Page $page -Path "C:\output\page.png"
```

## PARAMETERS

### -Page

Specifies the Playwright page (`IPage`) to capture the screenshot from. If not provided, the current page context is used.

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

### -Path

The file path where the screenshot image will be saved. Required.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
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

Returns the result of the screenshot operation. Typically, no output unless an error occurs.

## NOTES

This command is useful for visual regression testing and archiving page states.

## RELATED LINKS


See also:

- [Microsoft.Playwright.IPage.ScreenshotAsync](https://playwright.dev/dotnet/docs/api/class-page#pagescreenshot)
- [Playwright Documentation](https://playwright.dev/)

