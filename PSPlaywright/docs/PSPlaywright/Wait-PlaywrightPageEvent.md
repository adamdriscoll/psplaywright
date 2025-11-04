---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Wait-PlaywrightPageEvent
---

# Wait-PlaywrightPageEvent

## SYNOPSIS

Waits for a specific event to occur on a Playwright page, such as requests, responses, URL changes, function evaluations, load states, and more.

## SYNTAX

### __AllParameterSets

```
Wait-PlaywrightPageEvent -EventType <string> [-UrlOrPredicate <string>]
 [-ResponseUrlOrPredicate <string>] [-Url <string>] [-Expression <string>] [-Argument <Object>]
 [-State <LoadState>] [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Wait-PlaywrightPageEvent allows you to pause execution until a specified event occurs on a Playwright page. Supported events include:

- Request: Waits for a network request matching a URL or predicate.
- Response: Waits for a network response matching a URL or predicate.
- URL: Waits for the page to navigate to a specific URL.
- Function: Waits for a JavaScript function to return true.
- LoadState: Waits for the page to reach a specific load state.
- Popup, Download, ConsoleMessage, FileChooser, RequestFinished, WebSocket, Worker: Waits for these respective events.

Use the appropriate parameters to specify event details. The cmdlet uses Playwright's async wait methods and blocks until the event occurs or a timeout is reached.

## EXAMPLES

### Example 1

Wait for a page to reach the 'load' state after navigation:

```powershell
$browser = Start-PlaywrightBrowser -Headless
$page = Open-PlaywrightPage -Browser $browser
$null = $page | Wait-PlaywrightPageEvent -EventType 'LoadState' -State ([Microsoft.Playwright.LoadState]::Load)
Stop-PlaywrightBrowser -Browser $browser
```

## PARAMETERS

### -Argument

An argument to pass to the JavaScript function when using the 'Function' event type.

```yaml
Type: System.Object
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

### -EventType

Specifies the type of event to wait for. Valid values: Request, Response, URL, Function, LoadState, Popup, Download, ConsoleMessage, FileChooser, RequestFinished, WebSocket, Worker.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
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

JavaScript expression to evaluate for the 'Function' event type.

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

### -Page

The Playwright IPage object to operate on. Can be provided via pipeline.

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

### -ResponseUrlOrPredicate

URL or predicate to match for the 'Response' event type.

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

### -State

The load state to wait for when using the 'LoadState' event type. Example: [Microsoft.Playwright.LoadState]::Load

```yaml
Type: Microsoft.Playwright.LoadState
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

### -Url

The URL to wait for when using the 'URL' event type.

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

### -UrlOrPredicate

URL or predicate to match for the 'Request' event type.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Playwright.IPage

Accepts a Playwright IPage object.

## OUTPUTS

### System.Object

Returns the result of the awaited event, or $null if not applicable.

## NOTES

This cmdlet wraps Playwright's asynchronous event waiting methods for use in PowerShell scripts.

## RELATED LINKS

[Playwright .NET API Reference](https://playwright.dev/dotnet/docs/api/class-page)

