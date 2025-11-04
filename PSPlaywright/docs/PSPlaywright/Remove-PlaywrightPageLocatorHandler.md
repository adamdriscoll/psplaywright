---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Remove-PlaywrightPageLocatorHandler
---

# Remove-PlaywrightPageLocatorHandler

## SYNOPSIS

Removes a previously registered locator handler from the page.

## SYNTAX

### __AllParameterSets

```
Remove-PlaywrightPageLocatorHandler [-Locator] <ILocator> [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Remove-PlaywrightPageLocatorHandler cmdlet removes a locator handler that was previously registered on the page. Locator handlers are used to handle specific UI elements or conditions during automation.

## EXAMPLES

### Example 1: Remove a locator handler

```powershell
$locator = Get-PlaywrightPageLocator -Selector ".modal-close"
Remove-PlaywrightPageLocatorHandler -Locator $locator
```

Removes the locator handler for the specified locator.

## PARAMETERS

### -Locator

The locator for which to remove the handler.

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

### Microsoft.Playwright.ILocator

You can pipe a locator object to this cmdlet.

## OUTPUTS

### System.Object

This cmdlet does not return any output.

## NOTES

- Locator handlers are typically used to automatically handle popups, modals, or other dynamic UI elements.
- This cmdlet is used to clean up handlers when they are no longer needed.

## RELATED LINKS

[Get-PlaywrightPageLocator](Get-PlaywrightPageLocator.md)

