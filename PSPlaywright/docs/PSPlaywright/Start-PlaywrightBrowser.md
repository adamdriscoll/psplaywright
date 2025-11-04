---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Start-PlaywrightBrowser
---

# Start-PlaywrightBrowser

## SYNOPSIS

Launches a Playwright browser instance (Chromium, Firefox, or WebKit).

## SYNTAX

### __AllParameterSets

```
Start-PlaywrightBrowser [-BrowserType <string>] [-Headless] [-Enter] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Start-PlaywrightBrowser cmdlet launches a browser instance of the specified type. You can launch Chromium, Firefox, or WebKit browsers in either headless or headed mode. The browser instance is returned so you can create pages and interact with web content.

## EXAMPLES

### Example 1: Launch a headless Chromium browser

```powershell
$browser = Start-PlaywrightBrowser
```

Launches a Chromium browser in headless mode (default).

### Example 2: Launch Firefox in headed mode

```powershell
$browser = Start-PlaywrightBrowser -BrowserType firefox -Headless:$false
```

Launches Firefox with a visible window.

### Example 3: Launch browser and enter context

```powershell
Start-PlaywrightBrowser -Enter
```

Launches a browser and enters it into the current context, making it the default browser for subsequent commands.

## PARAMETERS

### -BrowserType

Specifies the type of browser to launch. Valid values are 'chromium', 'firefox', or 'webkit'. Default is 'chromium'.

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

### -Enter

When specified, enters the browser into the current context, making it the default browser for subsequent page commands.

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

### -Headless

Runs the browser in headless mode (without a visible window). This is the default behavior. Specify -Headless:$false to show the browser window.

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

Returns the browser instance (Microsoft.Playwright.IBrowser).

## NOTES

- Requires that Start-Playwright has been called first to initialize the Playwright instance.
- Use Stop-PlaywrightBrowser to close the browser when you're done.
- Headless mode is useful for automated testing and web scraping scenarios.

## RELATED LINKS

[Start-Playwright](Start-Playwright.md)
[Stop-PlaywrightBrowser](Stop-PlaywrightBrowser.md)
[Open-PlaywrightPage](Open-PlaywrightPage.md)

