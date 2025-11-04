---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Suspend-PlaywrightPage
---

# Suspend-PlaywrightPage

## SYNOPSIS

Pauses script execution and opens the Playwright Inspector for debugging.

## SYNTAX

### __AllParameterSets

```
Suspend-PlaywrightPage [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Suspend-PlaywrightPage cmdlet pauses the execution of your script and opens the Playwright Inspector tool. This is useful for debugging your automation scripts, allowing you to inspect the page state, step through actions, and troubleshoot issues.

## EXAMPLES

### Example 1: Pause execution for debugging

```powershell
Open-PlaywrightPageUrl -Url "https://example.com"
Suspend-PlaywrightPage
```

Navigates to a URL and then pauses execution, opening the Playwright Inspector for debugging.

## PARAMETERS

### -Page

Suspend a Playwright page:

```powershell
$browser = Start-PlaywrightBrowser -Headless
$page = Open-PlaywrightPage -Browser $browser
$null = $page | Suspend-PlaywrightPage
Stop-PlaywrightBrowser -Browser $browser
```

```yaml
Type: Microsoft.Playwright.IPage
The Playwright IPage object to suspend. Can be provided via pipeline.
SupportsWildcards: false
Aliases: []
ParameterSets:
None
  Position: Named
  IsRequired: false
  ValueFromPipeline: true
Accepts a Playwright IPage object.
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
Returns $null. (No output is expected.)
```

This cmdlet is a placeholder. Implementation may be added in future versions.

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
[Playwright .NET API Reference](https://playwright.dev/dotnet/docs/api/class-page)
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Playwright.IPage

You can pipe a page object to this cmdlet.

## OUTPUTS

### System.Object

This cmdlet does not return any output.

## NOTES

- The Playwright Inspector window will open when this cmdlet is called.
- Script execution will resume when you close the inspector or click the resume button.
- This is primarily used for debugging and development purposes.

## RELATED LINKS

[Open-PlaywrightPageUrl](Open-PlaywrightPageUrl.md)

