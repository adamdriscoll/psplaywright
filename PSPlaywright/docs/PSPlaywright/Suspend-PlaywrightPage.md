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

{{ Fill in the Synopsis }}

## SYNTAX

### __AllParameterSets

```
Suspend-PlaywrightPage [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

{{ Fill in the Description }}

## EXAMPLES

### Example 1
Suspends the execution of a Playwright page. (Implementation details may vary.)
{{ Add example description here }}

Suspend-PlaywrightPage is intended to pause or suspend activity on a Playwright page. The exact behavior depends on the implementation. Use this cmdlet to temporarily halt page actions in automation scripts.

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

{{ Fill in the Description }}

## OUTPUTS

### System.Object

{{ Fill in the Description }}

## NOTES

{{ Fill in the Notes }}

## RELATED LINKS

{{ Fill in the related links here }}

