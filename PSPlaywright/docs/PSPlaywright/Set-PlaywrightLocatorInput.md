---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Set-PlaywrightLocatorInput
---

# Set-PlaywrightLocatorInput

## SYNOPSIS

Interacts with input elements using a Playwright locator (fill, clear, press keys).

## SYNTAX

### __AllParameterSets

```
Set-PlaywrightLocatorInput [-Locator] <ILocator> [[-Action] <string>] [-Value <string>]
 [-Delay <double>] [-Force <bool>] [-Timeout <double>] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Set-PlaywrightLocatorInput cmdlet provides multiple ways to interact with input elements. It supports filling text (Fill), clearing input (Clear), pressing individual keys (Press), and typing text character by character (PressSequentially).

## EXAMPLES

### Example 1: Fill an input field

```powershell
$locator = Get-PlaywrightPageLocator -Selector "#username"
Set-PlaywrightLocatorInput -Locator $locator -Action Fill -Value "testuser"
```

Fills the username field with "testuser".

### Example 2: Clear an input field

```powershell
$locator = Get-PlaywrightPageLocator -Selector "#search"
Set-PlaywrightLocatorInput -Locator $locator -Action Clear
```

Clears the search input field.

### Example 3: Press Enter key

```powershell
$locator = Get-PlaywrightPageLocator -Selector "#password"
Set-PlaywrightLocatorInput -Locator $locator -Action Press -Value "Enter"
```

Presses the Enter key on the password field.

### Example 4: Type text with delay

```powershell
$locator = Get-PlaywrightPageLocator -Selector "#email"
Set-PlaywrightLocatorInput -Locator $locator -Action PressSequentially -Value "test@example.com" -Delay 100
```

Types the email address character by character with a 100ms delay between each character.

## PARAMETERS

### -Action

The action to perform. Valid values are: Fill (default), Clear, Press, PressSequentially.

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

### -Delay

Delay in milliseconds between key presses. Used with Press and PressSequentially actions.

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

### -Value

The text value or key to input. Required for Fill, Press, and PressSequentially actions.

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

- Use Fill for quickly setting input values.
- Use PressSequentially to simulate realistic typing with delays.
- Use Press for special keys like Enter, Tab, Escape, etc.
- For more details, see https://playwright.dev/dotnet/docs/api/class-locator

## RELATED LINKS

[Get-PlaywrightPageLocator](Get-PlaywrightPageLocator.md)
[Set-PlaywrightLocatorSelect](Set-PlaywrightLocatorSelect.md)

