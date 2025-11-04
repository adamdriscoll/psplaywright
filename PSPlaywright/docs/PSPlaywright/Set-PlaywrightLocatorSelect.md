---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Set-PlaywrightLocatorSelect
---

# Set-PlaywrightLocatorSelect

## SYNOPSIS

Interacts with checkbox, select, and file input elements using a Playwright locator.

## SYNTAX

### __AllParameterSets

```
Set-PlaywrightLocatorSelect [-Locator] <ILocator> [[-Action] <string>] [-CheckedState <bool>]
 [-SelectOptions <string>] [-InputFiles <string>] [-Force <bool>] [-Timeout <double>]
 [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Set-PlaywrightLocatorSelect cmdlet provides multiple ways to interact with checkboxes, select elements, and file inputs. It supports checking (Check), unchecking (Uncheck), setting checked state (SetChecked), selecting options (SelectOption), and setting input files (SetInputFiles).

## EXAMPLES

### Example 1: Check a checkbox

```powershell
$locator = Get-PlaywrightPageLocator -Selector "#agree"
Set-PlaywrightLocatorSelect -Locator $locator -Action Check
```

Checks the checkbox with id "agree".

### Example 2: Uncheck a checkbox

```powershell
$locator = Get-PlaywrightPageLocator -Selector "#newsletter"
Set-PlaywrightLocatorSelect -Locator $locator -Action Uncheck
```

Unchecks the newsletter checkbox.

### Example 3: Set checkbox state

```powershell
$locator = Get-PlaywrightPageLocator -Selector "#terms"
Set-PlaywrightLocatorSelect -Locator $locator -Action SetChecked -CheckedState $true
```

Sets the checkbox to checked state.

### Example 4: Select an option from dropdown

```powershell
$locator = Get-PlaywrightPageLocator -Selector "#country"
Set-PlaywrightLocatorSelect -Locator $locator -Action SelectOption -SelectOptions "USA"
```

Selects "USA" from the country dropdown.

### Example 5: Set file input

```powershell
$locator = Get-PlaywrightPageLocator -Selector "#upload"
Set-PlaywrightLocatorSelect -Locator $locator -Action SetInputFiles -InputFiles "C:\path\to\file.txt"
```

Sets a file for the file input element.

## PARAMETERS

### -Action

The action to perform. Valid values are: Check (default), Uncheck, SetChecked, SelectOption, SetInputFiles.

```yaml
Type: System.String
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

### -CheckedState

Boolean value for the SetChecked action. True to check, false to uncheck.

```yaml
Type: System.Nullable`1[System.Boolean]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Force

Forces the action even if the element is not actionable (bypasses actionability checks).

```yaml
Type: System.Nullable`1[System.Boolean]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -InputFiles

File path(s) for the SetInputFiles action.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
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

The Playwright locator object representing the element to interact with.

```yaml
Type: Microsoft.Playwright.ILocator
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

### -SelectOptions

The option value(s) to select for the SelectOption action.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Timeout

Maximum time to wait for the action to complete, in milliseconds.

```yaml
Type: System.Nullable`1[System.Double]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
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

## OUTPUTS

### System.Object

This cmdlet does not return any output.

## NOTES

- Use Check/Uncheck for simple checkbox operations.
- Use SetChecked when you need to conditionally set the checkbox state.
- Use SelectOption for dropdown/select elements.
- Use SetInputFiles for file upload inputs.
- For more details, see the Playwright documentation.

## RELATED LINKS

[Get-PlaywrightPageLocator](Get-PlaywrightPageLocator.md)
[Set-PlaywrightLocatorInput](Set-PlaywrightLocatorInput.md)

