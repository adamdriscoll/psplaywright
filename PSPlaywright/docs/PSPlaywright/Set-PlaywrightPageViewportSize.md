---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Set-PlaywrightPageViewportSize
---

# Set-PlaywrightPageViewportSize

## SYNOPSIS

Sets the viewport size of the current page.

## SYNTAX

### __AllParameterSets

```
Set-PlaywrightPageViewportSize [-Width] <int> [-Height] <int> [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Set-PlaywrightPageViewportSize cmdlet changes the viewport dimensions of the browser page. This is useful for testing responsive designs or simulating different device screen sizes.

## EXAMPLES

### Example 1: Set viewport to desktop size

```powershell
Set-PlaywrightPageViewportSize -Width 1920 -Height 1080
```

Sets the viewport to a common desktop resolution.

### Example 2: Set viewport to mobile size

```powershell
Set-PlaywrightPageViewportSize -Width 375 -Height 667
```

Sets the viewport to an iPhone size for mobile testing.

## PARAMETERS

### -Height

The height of the viewport in pixels.

```yaml
Type: System.Int32
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

### -Width

The width of the viewport in pixels.

```yaml
Type: System.Int32
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

- The viewport size affects how the page is rendered and which media queries are active.
- This does not change the actual browser window size, only the viewport.

## RELATED LINKS

[Open-PlaywrightPage](Open-PlaywrightPage.md)

