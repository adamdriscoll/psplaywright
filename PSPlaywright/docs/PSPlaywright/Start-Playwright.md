---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Start-Playwright
---

# Start-Playwright

## SYNOPSIS

Initializes and starts a Playwright instance for browser automation.

## SYNTAX

### __AllParameterSets

```
Start-Playwright [-PassThru] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Start-Playwright cmdlet creates and initializes a new Playwright instance in the current context. This is typically the first command you run when using PSPlaywright to automate web browsers. The Playwright instance must be started before you can launch any browsers.

## EXAMPLES

### Example 1: Start Playwright without output

```powershell
Start-Playwright
```

This command starts a Playwright instance without returning the instance object.

### Example 2: Start Playwright and capture the instance

```powershell
$playwright = Start-Playwright -PassThru
```

This command starts a Playwright instance and returns the instance object for use in subsequent commands.

## PARAMETERS

### -PassThru

When specified, returns the Playwright instance object. By default, this cmdlet does not generate any output.

```yaml
Type: System.Management.Automation.SwitchParameter
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

When the PassThru parameter is specified, returns the Playwright instance object (Microsoft.Playwright.IPlaywright).

## NOTES

- This cmdlet must be called before starting any browsers with Start-PlaywrightBrowser.
- If a Playwright instance is already started in the current context, this cmdlet will throw an error.
- Use Stop-Playwright to clean up resources when you're done with browser automation.

## RELATED LINKS

[Stop-Playwright](Stop-Playwright.md)
[Start-PlaywrightBrowser](Start-PlaywrightBrowser.md)

