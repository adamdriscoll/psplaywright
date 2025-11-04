---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Add-PlaywrightPageInitScript
---

# Add-PlaywrightPageInitScript

## SYNOPSIS

Adds a JavaScript initialization script to a Playwright page before any other scripts run.

## SYNTAX

### __AllParameterSets

```
Add-PlaywrightPageInitScript [-Script] <string> [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Add-PlaywrightPageInitScript` to inject custom JavaScript into a Playwright page. This script will be executed before any other scripts on the page, allowing you to set up global variables, override functions, or perform other setup tasks. The command can be used with an existing page object or the current context.

## EXAMPLES

### Example 1


Inject a script that sets a global variable before page scripts execute:

```powershell
$script = "window.myGlobalVar = 'Hello, Playwright!';"
Add-PlaywrightPageInitScript -Script $script -Page $page
```

## PARAMETERS

### -Page

Specifies the Playwright page (`IPage`) to inject the initialization script into. If not provided, the current page context is used.

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

### -Script

The JavaScript code to inject into the page. This script will run before any other scripts on the page.

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

Returns the result of the initialization script injection. Typically, no output unless an error occurs.

## NOTES

This command is useful for setting up the page environment, mocking APIs, or overriding browser features before the page loads any content.

## RELATED LINKS

See also:
- [Microsoft.Playwright.IPage.AddInitScriptAsync](https://playwright.dev/dotnet/docs/api/class-page#pageaddinitscript)
- [Playwright Documentation](https://playwright.dev/)

