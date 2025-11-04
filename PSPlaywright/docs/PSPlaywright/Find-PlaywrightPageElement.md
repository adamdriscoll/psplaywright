---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Find-PlaywrightPageElement
---

# Find-PlaywrightPageElement

## SYNOPSIS

Finds a Playwright page element using various strategies such as alt text, label, role, test ID, text, title, or selector.

## SYNTAX

### ByAltText (Default)

```
Find-PlaywrightPageElement -AltText <string> [-Page <IPage>] [<CommonParameters>]
```

### ByLabel

```
Find-PlaywrightPageElement -Label <string> [-Page <IPage>] [<CommonParameters>]
```

### ByRole

```
Find-PlaywrightPageElement -Role <string> [-Page <IPage>] [<CommonParameters>]
```

### ByTestId

```
Find-PlaywrightPageElement -TestId <string> [-Page <IPage>] [<CommonParameters>]
```

### ByText

```
Find-PlaywrightPageElement -Text <string> [-Page <IPage>] [<CommonParameters>]
```

### ByTitle

```
Find-PlaywrightPageElement -Title <string> [-Page <IPage>] [<CommonParameters>]
```

### BySelector

```
Find-PlaywrightPageElement -Selector <string> [-LocatorOptions <PageLocatorOptions>] [-Page <IPage>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use `Find-PlaywrightPageElement` to locate elements on a Playwright page using different strategies. You can search by alt text, label, role, test ID, text, title, or CSS selector. Returns a Playwright locator (`ILocator`) for further actions.

## EXAMPLES

### Example 1


Find a button by its label:

```powershell
$locator = Find-PlaywrightPageElement -Label "Submit" -Page $page
$locator.ClickAsync()
```

Find an element by CSS selector:

```powershell
$locator = Find-PlaywrightPageElement -Selector "#main-content" -Page $page
```

## PARAMETERS

### -AltText

Finds an element by its alt text attribute.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ByAltText
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Label

Finds an element by its label text.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ByLabel
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -LocatorOptions

Additional options for locating elements by selector.

```yaml
Type: Microsoft.Playwright.PageLocatorOptions
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BySelector
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

Specifies the Playwright page (`IPage`) to search for the element. If not provided, the current page context is used.

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

### -Role

Finds an element by its ARIA role.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ByRole
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Selector

Finds an element by a CSS selector string.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: BySelector
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -TestId

Finds an element by its test ID attribute.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ByTestId
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Text

Finds an element by its text content.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ByText
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Title

Finds an element by its title attribute.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ByTitle
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

### Microsoft.Playwright.ILocator

Returns a Playwright locator (`ILocator`) for the found element.

## NOTES

This command is useful for flexible element location in automated UI tests.

## RELATED LINKS


See also:

- [Microsoft.Playwright.ILocator](https://playwright.dev/dotnet/docs/api/class-locator)
- [Playwright Documentation](https://playwright.dev/)

