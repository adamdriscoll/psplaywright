---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Invoke-PlaywrightPageKeyboard
---

# Invoke-PlaywrightPageKeyboard

## SYNOPSIS

Invokes keyboard actions on a Playwright page, such as typing, pressing, or sending key events.

## SYNTAX

### Type (Default)

```
Invoke-PlaywrightPageKeyboard -Text <string> [-Page <IPage>] [<CommonParameters>]
```

### Press

```
Invoke-PlaywrightPageKeyboard -Key <string> [-Page <IPage>] [<CommonParameters>]
```

### Down

```
Invoke-PlaywrightPageKeyboard -DownKey <string> [-Page <IPage>] [<CommonParameters>]
```

### Up

```
Invoke-PlaywrightPageKeyboard -UpKey <string> [-Page <IPage>] [<CommonParameters>]
```

### InsertText

```
Invoke-PlaywrightPageKeyboard -InsertText <string> [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Invoke-PlaywrightPageKeyboard` to simulate keyboard input on a Playwright page. You can type text, press keys, send key down/up events, or insert text directly.

## EXAMPLES

### Example 1


Type text into an input:

```powershell
Invoke-PlaywrightPageKeyboard -Text "Hello World" -Page $page
```

Press the Enter key:

```powershell
Invoke-PlaywrightPageKeyboard -Key "Enter" -Page $page
```

## PARAMETERS

### -DownKey

The key to send a key down event for.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Down
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -InsertText

Text to insert directly into the page.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: InsertText
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Key

The key to press (e.g., "Enter", "Tab").

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Press
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Page

Specifies the Playwright page (`IPage`) to send keyboard actions to. If not provided, the current page context is used.

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

### -Text

Text to type into the page.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Type
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -UpKey

The key to send a key up event for.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Up
  Position: Named
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

Returns the result of the keyboard action. Typically, no output unless an error occurs.

## NOTES

This command is useful for simulating user keyboard input in automated UI tests.

## RELATED LINKS


See also:

- [Microsoft.Playwright.Keyboard](https://playwright.dev/dotnet/docs/api/class-keyboard)
- [Playwright Documentation](https://playwright.dev/)

