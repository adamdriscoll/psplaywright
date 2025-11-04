---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Assert-PlaywrightLocator
---

# Assert-PlaywrightLocator

## SYNOPSIS

Asserts various conditions on a Playwright locator, such as visibility, state, text, or attribute values.

## SYNTAX

### IsVisible (Default)

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-IsVisible] [<CommonParameters>]
```

### IsHidden

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-IsHidden] [<CommonParameters>]
```

### IsChecked

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-IsChecked] [<CommonParameters>]
```

### IsDisabled

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-IsDisabled] [<CommonParameters>]
```

### IsEditable

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-IsEditable] [<CommonParameters>]
```

### IsEnabled

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-IsEnabled] [<CommonParameters>]
```

### IsEmpty

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-IsEmpty] [<CommonParameters>]
```

### IsFocused

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-IsFocused] [<CommonParameters>]
```

### HasText

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-HasText <string>] [<CommonParameters>]
```

### HasValue

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-HasValue <string>] [<CommonParameters>]
```

### HasAttribute

```
Assert-PlaywrightLocator [-Locator] <ILocator> [-AttributeName <string>] [-AttributeValue <string>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Assert-PlaywrightLocator` to verify the state or properties of a Playwright locator. This command supports multiple assertion types, including visibility, checked state, enabled/disabled, text, value, and attributes. If the assertion fails, an error is thrown.

## EXAMPLES

### Example 1


Assert that a button is visible and enabled:

```powershell
$locator = $page.Locator("button#submit")
Assert-PlaywrightLocator -Locator $locator -IsVisible -IsEnabled
```

Assert that a checkbox is checked:

```powershell
$locator = $page.Locator("input[type='checkbox']")
Assert-PlaywrightLocator -Locator $locator -IsChecked
```

Assert that a label has specific text:

```powershell
$locator = $page.Locator("label#status")
Assert-PlaywrightLocator -Locator $locator -HasText "Success"
```

## PARAMETERS

### -AttributeName

The name of the attribute to assert on the locator.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: HasAttribute
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -AttributeValue

The expected value of the attribute to assert.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: HasAttribute
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -HasText

The expected text content of the locator.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: HasText
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -HasValue

The expected value of the locator (e.g., input value).

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: HasValue
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IsChecked

Assert that the locator is checked (e.g., checkbox or radio button).

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: IsChecked
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IsDisabled

Assert that the locator is disabled.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: IsDisabled
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IsEditable

Assert that the locator is editable.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: IsEditable
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IsEmpty

Assert that the locator is empty (no content).

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: IsEmpty
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IsEnabled

Assert that the locator is enabled.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: IsEnabled
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IsFocused

Assert that the locator is focused.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: IsFocused
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IsHidden

Assert that the locator is hidden.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: IsHidden
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -IsVisible

Assert that the locator is visible.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: IsVisible
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Locator

The Playwright locator (`ILocator`) to assert against. This identifies the element or set of elements to check.

```yaml
Type: Microsoft.Playwright.ILocator
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
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

### Microsoft.Playwright.ILocator

Accepts a Playwright `ILocator` object as input.

## OUTPUTS

### System.Object

Returns the result of the assertion. Throws an error if the assertion fails.

## NOTES

This command is useful for validating UI state and properties in automated tests.

## RELATED LINKS


See also:

- [Microsoft.Playwright.ILocator](https://playwright.dev/dotnet/docs/api/class-locator)
- [Playwright Documentation](https://playwright.dev/)

