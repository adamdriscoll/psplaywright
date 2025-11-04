---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Stop-PlaywrightBrowser
---

# Stop-PlaywrightBrowser

## SYNOPSIS

Closes a Playwright browser instance.

## SYNTAX

### __AllParameterSets

```
Stop-PlaywrightBrowser [-Browser <IBrowser>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Stop-PlaywrightBrowser cmdlet closes a browser instance that was launched with Start-PlaywrightBrowser. This will close all pages and contexts within the browser.

## EXAMPLES

### Example 1: Close a browser instance

```powershell
$browser = Start-PlaywrightBrowser
# ... perform automation ...
Stop-PlaywrightBrowser -Browser $browser
```

Closes the specified browser instance.

### Example 2: Close browser from pipeline

```powershell
Start-PlaywrightBrowser | Stop-PlaywrightBrowser
```

Closes the browser instance passed through the pipeline.

## PARAMETERS

### -Browser

The browser instance to close. If not specified, the browser from the current context will be used.

```yaml
Type: Microsoft.Playwright.IBrowser
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

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases:
- cf
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

### -WhatIf

Runs the command in a mode that only reports what would happen without performing the actions.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases:
- wi
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

### Microsoft.Playwright.IBrowser

You can pipe a browser instance to this cmdlet.

## OUTPUTS

### System.Void

This cmdlet does not return any output.

## NOTES

- This cmdlet supports ShouldProcess, so you can use -WhatIf and -Confirm parameters.
- Closing a browser will automatically close all pages and contexts within it.

## RELATED LINKS

[Start-PlaywrightBrowser](Start-PlaywrightBrowser.md)
[Stop-Playwright](Stop-Playwright.md)

