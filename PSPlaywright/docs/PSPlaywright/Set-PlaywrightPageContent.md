---
document type: cmdlet
external help file: psplaywright.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: PSPlaywright
ms.date: 11/03/2025
PlatyPS schema version: 2024-05-01
title: Set-PlaywrightPageContent
---

# Set-PlaywrightPageContent

## SYNOPSIS

Sets the HTML content of the current page.

## SYNTAX

### __AllParameterSets

```
Set-PlaywrightPageContent [-Html] <string> [-Page <IPage>] [<CommonParameters>]
```

## ALIASES

None

## DESCRIPTION

The Set-PlaywrightPageContent cmdlet replaces the entire HTML content of the current page with the specified HTML string. This is useful for testing with custom HTML or dynamically generating page content.

## EXAMPLES

### Example 1: Set simple HTML content

```powershell
Set-PlaywrightPageContent -Html "<html><body><h1>Hello World</h1></body></html>"
```

Sets the page content to the specified HTML.

### Example 2: Set content with a form

```powershell
$html = @"
<html>
<body>
    <form>
        <input type="text" id="username" />
        <button type="submit">Submit</button>
    </form>
</body>
</html>
"@
Set-PlaywrightPageContent -Html $html
```

Sets the page content to HTML containing a form, useful for testing form interactions.

## PARAMETERS

### -Html

The HTML content to set on the page. This should be a complete HTML document string.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Page

The page object to perform the operation on. If not specified, uses the page from the current context.

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

You can pipe a page object to this cmdlet.

## OUTPUTS

### System.Object

This cmdlet does not return any output.

## NOTES

- The HTML content replaces the entire page content.
- This is particularly useful for testing scenarios where you want to work with custom HTML without loading an external URL.

## RELATED LINKS

[Open-PlaywrightPageUrl](Open-PlaywrightPageUrl.md)

