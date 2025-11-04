---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Set-PlaywrightPageMedia
---

# Set-PlaywrightPageMedia

## SYNOPSIS

Emulates media types and color schemes for the page.

## SYNTAX

### __AllParameterSets

```
Set-PlaywrightPageMedia [[-Media] <Media>] [[-ColorScheme] <ColorScheme>] [-Page <IPage>]
 [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Set-PlaywrightPageMedia cmdlet allows you to emulate different media types (screen, print) and color schemes (light, dark, no-preference) for testing responsive designs and CSS media queries.

## EXAMPLES

### Example 1: Emulate print media

```powershell
Set-PlaywrightPageMedia -Media Print
```

Emulates print media for testing print stylesheets.

### Example 2: Emulate dark color scheme

```powershell
Set-PlaywrightPageMedia -ColorScheme Dark
```

Emulates dark mode to test dark theme CSS.

## PARAMETERS

### -ColorScheme

The color scheme to emulate. Valid values are Light, Dark, or NoPreference.

```yaml
Type: System.Nullable`1[Microsoft.Playwright.ColorScheme]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Media

The media type to emulate. Valid values are Screen, Print, or Null.

```yaml
Type: System.Nullable`1[Microsoft.Playwright.Media]
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

- This is useful for testing responsive designs and CSS media queries.
- Changes take effect immediately and trigger any relevant CSS media query changes.

## RELATED LINKS

[Set-PlaywrightPageViewportSize](Set-PlaywrightPageViewportSize.md)

