---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Set-PlaywrightPageDragAndDrop
---

# Set-PlaywrightPageDragAndDrop

## SYNOPSIS

Performs a drag and drop operation from a source element to a target element.

## SYNTAX

### __AllParameterSets

```
Set-PlaywrightPageDragAndDrop [-SourceSelector] <string> [-TargetSelector] <string> [-Page <IPage>]
 [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Set-PlaywrightPageDragAndDrop cmdlet simulates a drag and drop operation by dragging an element from the source selector to the target selector. This is useful for testing drag and drop functionality in web applications.

## EXAMPLES

### Example 1: Drag and drop an element

```powershell
Set-PlaywrightPageDragAndDrop -SourceSelector "#draggable" -TargetSelector "#dropzone"
```

Drags the element with id "draggable" and drops it onto the element with id "dropzone".

## PARAMETERS

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

### -SourceSelector

The CSS selector of the element to drag from.

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

### -TargetSelector

The CSS selector of the element to drop onto.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
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

- Both the source and target elements must be visible and interactable.
- The drag and drop operation is performed as if a user were dragging with a mouse.

## RELATED LINKS

[Get-PlaywrightPageLocator](Get-PlaywrightPageLocator.md)

