---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Invoke-PlaywrightPageMouse
---

# Invoke-PlaywrightPageMouse

## SYNOPSIS

{{ Fill in the Synopsis }}

## SYNTAX

### Move (Default)

```
Invoke-PlaywrightPageMouse -X <float> -Y <float> [-Steps <int>] [-Page <IPage>] [<CommonParameters>]
```

### Click

```
Invoke-PlaywrightPageMouse -ClickX <float> -ClickY <float> [-ClickCount <int>]
 [-Button <MouseButton>] [-Delay <float>] [-Page <IPage>] [<CommonParameters>]
```

### Down

```
Invoke-PlaywrightPageMouse [-DownButton <MouseButton>] [-DownClickCount <int>] [-Page <IPage>]
 [<CommonParameters>]
```

### Up

```
Invoke-PlaywrightPageMouse [-UpButton <MouseButton>] [-UpClickCount <int>] [-Page <IPage>]
 [<CommonParameters>]
```

### Wheel

```
Invoke-PlaywrightPageMouse -DeltaX <float> -DeltaY <float> [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

{{ Fill in the Description }}

## EXAMPLES

### Example 1

{{ Add example description here }}

## PARAMETERS

### -Button

{{ Fill Button Description }}

```yaml
Type: System.Nullable`1[Microsoft.Playwright.MouseButton]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Click
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ClickCount

{{ Fill ClickCount Description }}

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Click
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ClickX

{{ Fill ClickX Description }}

```yaml
Type: System.Nullable`1[System.Single]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Click
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ClickY

{{ Fill ClickY Description }}

```yaml
Type: System.Nullable`1[System.Single]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Click
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Delay

{{ Fill Delay Description }}

```yaml
Type: System.Nullable`1[System.Single]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Click
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DeltaX

{{ Fill DeltaX Description }}

```yaml
Type: System.Nullable`1[System.Single]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Wheel
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DeltaY

{{ Fill DeltaY Description }}

```yaml
Type: System.Nullable`1[System.Single]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Wheel
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DownButton

{{ Fill DownButton Description }}

```yaml
Type: System.Nullable`1[Microsoft.Playwright.MouseButton]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Down
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DownClickCount

{{ Fill DownClickCount Description }}

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Down
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Page

{{ Fill Page Description }}

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

### -Steps

{{ Fill Steps Description }}

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Move
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -UpButton

{{ Fill UpButton Description }}

```yaml
Type: System.Nullable`1[Microsoft.Playwright.MouseButton]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Up
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -UpClickCount

{{ Fill UpClickCount Description }}

```yaml
Type: System.Nullable`1[System.Int32]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Up
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -X

{{ Fill X Description }}

```yaml
Type: System.Nullable`1[System.Single]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Move
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Y

{{ Fill Y Description }}

```yaml
Type: System.Nullable`1[System.Single]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Move
  Position: Named
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

{{ Fill in the Description }}

## OUTPUTS

### System.Object

{{ Fill in the Description }}

## NOTES

{{ Fill in the Notes }}

## RELATED LINKS

{{ Fill in the related links here }}

