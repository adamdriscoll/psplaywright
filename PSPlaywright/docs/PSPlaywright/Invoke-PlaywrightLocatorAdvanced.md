---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Invoke-PlaywrightLocatorAdvanced
---

# Invoke-PlaywrightLocatorAdvanced

## SYNOPSIS

Performs advanced actions on a Playwright locator, such as drag-and-drop, screenshot, scroll, dispatch event, wait, evaluate, and more.

## SYNTAX

### DragTo

```
Invoke-PlaywrightLocatorAdvanced [-Locator] <ILocator> -DragTo -TargetLocator <ILocator>
 [-Timeout <double>] [<CommonParameters>]
```

### Screenshot

```
Invoke-PlaywrightLocatorAdvanced [-Locator] <ILocator> -Screenshot [-Path <string>]
 [-Timeout <double>] [<CommonParameters>]
```

### ScrollIntoViewIfNeeded

```
Invoke-PlaywrightLocatorAdvanced [-Locator] <ILocator> -ScrollIntoViewIfNeeded [-Timeout <double>]
 [<CommonParameters>]
```

### DispatchEvent

```
Invoke-PlaywrightLocatorAdvanced [-Locator] <ILocator> -DispatchEvent -EventType <string>
 [-EventInit <Object>] [-Timeout <double>] [<CommonParameters>]
```

### WaitFor

```
Invoke-PlaywrightLocatorAdvanced [-Locator] <ILocator> -WaitFor [-State <WaitForSelectorState>]
 [-Timeout <double>] [<CommonParameters>]
```

### AriaSnapshot

```
Invoke-PlaywrightLocatorAdvanced [-Locator] <ILocator> -AriaSnapshot [-Timeout <double>]
 [<CommonParameters>]
```

### Evaluate

```
Invoke-PlaywrightLocatorAdvanced [-Locator] <ILocator> -Evaluate [-Timeout <double>]
 [-Expression <string>] [-EvalArg <Object>] [<CommonParameters>]
```

### EvaluateAll

```
Invoke-PlaywrightLocatorAdvanced [-Locator] <ILocator> -EvaluateAll [-Expression <string>]
 [-EvalArg <Object>] [<CommonParameters>]
```

### EvaluateHandle

```
Invoke-PlaywrightLocatorAdvanced [-Locator] <ILocator> -EvaluateHandle [-Timeout <double>]
 [-Expression <string>] [-EvalArg <Object>] [<CommonParameters>]
```

### SelectText

```
Invoke-PlaywrightLocatorAdvanced [-Locator] <ILocator> -SelectText [-Timeout <double>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Invoke-PlaywrightLocatorAdvanced` to perform advanced operations on a Playwright locator. Supported actions include drag-and-drop, taking screenshots, scrolling into view, dispatching events, waiting for state, evaluating JavaScript, and selecting text. Each action is triggered by a specific switch parameter.

## EXAMPLES

### Example 1


Drag one element to another:

```powershell
Invoke-PlaywrightLocatorAdvanced -Locator $source -DragTo -TargetLocator $target
```

Take a screenshot of an element:

```powershell
Invoke-PlaywrightLocatorAdvanced -Locator $locator -Screenshot -Path "C:\output\element.png"
```

Scroll an element into view:

```powershell
Invoke-PlaywrightLocatorAdvanced -Locator $locator -ScrollIntoViewIfNeeded
```

## PARAMETERS

### -AriaSnapshot

Captures an ARIA snapshot of the locator for accessibility testing.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: AriaSnapshot
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DispatchEvent

Dispatches a custom event of the specified type to the locator.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DispatchEvent
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DragTo

Drags the locator to the target locator.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DragTo
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EvalArg

Argument to pass to the evaluated JavaScript expression.

```yaml
Type: System.Object
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Evaluate
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: EvaluateAll
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: EvaluateHandle
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Evaluate

Evaluates a JavaScript expression on the locator.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Evaluate
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EvaluateAll

Evaluates a JavaScript expression on all matching locators.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: EvaluateAll
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EvaluateHandle

Evaluates a JavaScript expression and returns a handle to the result.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: EvaluateHandle
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EventInit

Initialization object for the dispatched event.

```yaml
Type: System.Object
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DispatchEvent
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EventType

Type of event to dispatch (e.g., 'click', 'input').

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DispatchEvent
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Expression

JavaScript expression to evaluate.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Evaluate
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: EvaluateAll
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: EvaluateHandle
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

The Playwright locator (`ILocator`) to perform the action on.

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

### -Path

File path to save the screenshot.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Screenshot
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Screenshot

Takes a screenshot of the locator.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Screenshot
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ScrollIntoViewIfNeeded

Scrolls the locator into view if needed.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ScrollIntoViewIfNeeded
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SelectText

Selects the text content of the locator.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: SelectText
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -State

State to wait for (e.g., 'visible', 'hidden', 'attached', 'detached').

```yaml
Type: System.Nullable`1[Microsoft.Playwright.WaitForSelectorState]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: WaitFor
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -TargetLocator

The target locator for drag-and-drop operations.

```yaml
Type: Microsoft.Playwright.ILocator
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DragTo
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Timeout

Timeout for the operation in milliseconds.

```yaml
Type: System.Nullable`1[System.Double]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DragTo
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Screenshot
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: ScrollIntoViewIfNeeded
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DispatchEvent
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: WaitFor
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: AriaSnapshot
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Evaluate
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: EvaluateHandle
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: SelectText
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -WaitFor

Waits for the locator to reach the specified state.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: WaitFor
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

## OUTPUTS

### System.Object

Returns the result of the advanced locator action. Output type depends on the action performed.

## NOTES

This command is useful for complex UI interactions and custom automation scenarios.

## RELATED LINKS


See also:

- [Microsoft.Playwright.ILocator](https://playwright.dev/dotnet/docs/api/class-locator)
- [Playwright Documentation](https://playwright.dev/)

