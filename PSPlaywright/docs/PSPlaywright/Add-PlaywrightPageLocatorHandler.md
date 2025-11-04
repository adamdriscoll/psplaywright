---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Add-PlaywrightPageLocatorHandler
---

# Add-PlaywrightPageLocatorHandler

## SYNOPSIS

Adds a handler script to a Playwright locator for custom event or action handling.

## SYNTAX

### __AllParameterSets

```
Add-PlaywrightPageLocatorHandler [-Locator] <ILocator> [-Handler] <scriptblock> [-Page <IPage>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Add-PlaywrightPageLocatorHandler` to attach a custom handler to a Playwright locator. The handler is a PowerShell script block that will be invoked when the locator is triggered, allowing for custom automation or validation logic.

## EXAMPLES

### Example 1


Attach a handler to a locator that logs when an element is clicked:

```powershell
$locator = $page.Locator("button#submit")
$handler = { param($loc) Write-Host "Button clicked!" }
Add-PlaywrightPageLocatorHandler -Locator $locator -Handler $handler -Page $page
```

## PARAMETERS

### -Handler

The PowerShell script block to execute when the locator is triggered. The locator instance is passed as a parameter to the handler.

```yaml
Type: System.Management.Automation.ScriptBlock
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

### -Locator

The Playwright locator (`ILocator`) to attach the handler to. This identifies the element or set of elements to monitor.

```yaml
Type: Microsoft.Playwright.ILocator
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

Specifies the Playwright page (`IPage`) containing the locator. If not provided, the current page context is used.

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

Accepts a Playwright `IPage` object as input.

## OUTPUTS

### System.Object

Returns the result of the handler attachment. Typically, no output unless an error occurs.

## NOTES

This command is useful for custom automation, logging, or validation when interacting with page elements.

## RELATED LINKS


See also:

- [Microsoft.Playwright.ILocator](https://playwright.dev/dotnet/docs/api/class-locator)
- [Playwright Documentation](https://playwright.dev/)

