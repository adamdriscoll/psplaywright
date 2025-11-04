# PSPlaywright

> **Work in Progress & Experimentation**
>
> This project is currently a work in progress and serves as an experiment in using GitHub Copilot to generate PowerShell modules for browser automation. The code, structure, and documentation are actively evolving as new features and improvements are explored. Feedback and contributions are welcome!

PSPlaywright is a PowerShell module that provides a set of commands for browser automation and web testing using [Microsoft Playwright](https://playwright.dev/). It enables users to control browsers, interact with web pages, and automate UI testing scenarios directly from PowerShell scripts.

## About Microsoft Playwright

Microsoft Playwright is a Node.js library for browser automation. It supports Chromium, Firefox, and WebKit, allowing for cross-browser web automation and testing. Playwright enables reliable end-to-end testing for modern web applications, supporting features like headless execution, network interception, and advanced page interactions.

## Commands

### Browser Commands

- [`Start-PlaywrightBrowser`](PSPlaywright/docs/PSPlaywright/Start-PlaywrightBrowser.md) - Start a new browser instance
- [`Stop-PlaywrightBrowser`](PSPlaywright/docs/PSPlaywright/Stop-PlaywrightBrowser.md) - Stop the browser instance
- [`Enter-PlaywrightBrowser`](PSPlaywright/docs/PSPlaywright/Enter-PlaywrightBrowser.md) - Enter a browser context
- [`Exit-PlaywrightBrowser`](PSPlaywright/docs/PSPlaywright/Exit-PlaywrightBrowser.md) - Exit the browser context
- [`Open-PlaywrightPage`](PSPlaywright/docs/PSPlaywright/Open-PlaywrightPage.md) - Open a new page in the browser

### Page Commands

The following Page cmdlets are available:

- [`Add-PlaywrightPageInitScript`](PSPlaywright/docs/PSPlaywright/Add-PlaywrightPageInitScript.md) - Add an initialization script to the page
- [`Add-PlaywrightPageLocatorHandler`](PSPlaywright/docs/PSPlaywright/Add-PlaywrightPageLocatorHandler.md) - Add a locator handler to the page
- [`Set-PlaywrightPageToFront`](PSPlaywright/docs/PSPlaywright/Set-PlaywrightPageToFront.md) - Bring the page to the front
- [`Close-PlaywrightPage`](PSPlaywright/docs/PSPlaywright/Close-PlaywrightPage.md) - Close the current page
- [`Get-PlaywrightPageContent`](PSPlaywright/docs/PSPlaywright/Get-PlaywrightPageContent.md) - Get the content of the page
- [`Set-PlaywrightPageDragAndDrop`](PSPlaywright/docs/PSPlaywright/Set-PlaywrightPageDragAndDrop.md) - Perform drag and drop on the page
- [`Set-PlaywrightPageMedia`](PSPlaywright/docs/PSPlaywright/Set-PlaywrightPageMedia.md) - Emulate media features on the page
- [`Enter-PlaywrightPage`](PSPlaywright/docs/PSPlaywright/Enter-PlaywrightPage.md) - Enter the page context
- [`Get-PlaywrightPageJavascriptHandle`](PSPlaywright/docs/PSPlaywright/Get-PlaywrightPageJavascriptHandle.md) - Evaluate JavaScript and get a handle
- [`Exit-PlaywrightPage`](PSPlaywright/docs/PSPlaywright/Exit-PlaywrightPage.md) - Exit the page context
- [`Find-PlaywrightPageElement`](PSPlaywright/docs/PSPlaywright/Find-PlaywrightPageElement.md) - Find an element on the page
- [`Open-PlaywrightPageUrl`](PSPlaywright/docs/PSPlaywright/Open-PlaywrightPageUrl.md) - Navigate to a URL
- [`Invoke-PlaywrightPageJavascript`](PSPlaywright/docs/PSPlaywright/Invoke-PlaywrightPageJavascript.md) - Invoke JavaScript on the page
- [`Invoke-PlaywrightPageKeyboard`](PSPlaywright/docs/PSPlaywright/Invoke-PlaywrightPageKeyboard.md) - Send keyboard input to the page
- [`Invoke-PlaywrightPageMouse`](PSPlaywright/docs/PSPlaywright/Invoke-PlaywrightPageMouse.md) - Send mouse input to the page
- [`Get-PlaywrightPageOpener`](PSPlaywright/docs/PSPlaywright/Get-PlaywrightPageOpener.md) - Get the opener of the page
- [`Invoke-PlaywrightPageNavigation`](PSPlaywright/docs/PSPlaywright/Invoke-PlaywrightPageNavigation.md) - Handle page navigation
- [`Suspend-PlaywrightPage`](PSPlaywright/docs/PSPlaywright/Suspend-PlaywrightPage.md) - Pause the page
- [`Get-PlaywrightPagePdf`](PSPlaywright/docs/PSPlaywright/Get-PlaywrightPagePdf.md) - Generate a PDF of the page
- [`Reset-PlaywrightPage`](PSPlaywright/docs/PSPlaywright/Reset-PlaywrightPage.md) - Reload the current page
- [`Remove-PlaywrightPageLocatorHandler`](PSPlaywright/docs/PSPlaywright/Remove-PlaywrightPageLocatorHandler.md) - Remove a locator handler from the page
- [`Invoke-PlaywrightPageGarageCollection`](PSPlaywright/docs/PSPlaywright/Invoke-PlaywrightPageGarageCollection.md) - Request garbage collection on the page
- [`Get-PlaywrightPageScreenshot`](PSPlaywright/docs/PSPlaywright/Get-PlaywrightPageScreenshot.md) - Take a screenshot of the page
- [`Set-PlaywrightPageContent`](PSPlaywright/docs/PSPlaywright/Set-PlaywrightPageContent.md) - Set the HTML content of the page
- [`Set-PlaywrightPageViewportSize`](PSPlaywright/docs/PSPlaywright/Set-PlaywrightPageViewportSize.md) - Set the viewport size of the page
- [`Get-PlaywrightPageTitle`](PSPlaywright/docs/PSPlaywright/Get-PlaywrightPageTitle.md) - Get the title of the page
- [`Wait-PlaywrightPageEvent`](PSPlaywright/docs/PSPlaywright/Wait-PlaywrightPageEvent.md) - Wait for a page event

### Locator Commands

- [`Assert-PlaywrightLocator`](PSPlaywright/docs/PSPlaywright/Assert-PlaywrightLocator.md) - Assert conditions on a locator
- [`Invoke-PlaywrightLocatorAdvanced`](PSPlaywright/docs/PSPlaywright/Invoke-PlaywrightLocatorAdvanced.md) - Perform advanced actions on a locator
- [`Invoke-PlaywrightLocatorClick`](PSPlaywright/docs/PSPlaywright/Invoke-PlaywrightLocatorClick.md) - Click an element
- [`Set-PlaywrightLocatorInput`](PSPlaywright/docs/PSPlaywright/Set-PlaywrightLocatorInput.md) - Set input value for an element
- [`Set-PlaywrightLocatorSelect`](PSPlaywright/docs/PSPlaywright/Set-PlaywrightLocatorSelect.md) - Select an option in a dropdown



## Prerequisites

**Node.js must be installed** for PSPlaywright to work. You can download Node.js from [nodejs.org](https://nodejs.org/). The module uses Playwright, which requires Node.js to run browser automation.

## Installation

You can install the PSPlaywright module from the PowerShell Gallery:

```powershell
Install-Module -Name 'PSPlaywright'
```

After importing the module, you must install the Playwright browsers required for automation:

```powershell
Install-Playwright
```

This will download and install Chromium, Firefox, and WebKit browsers for Playwright automation.

## Examples

### Start a Browser and Open a Page

```powershell
Start-PlaywrightBrowser -BrowserType Chromium -Enter
Open-PlaywrightPage -Url "https://playwright.dev/"
```

### Find an Element on a Page

```powershell
$element = Find-PlaywrightPageElement -AltText "Logo" -Page $page
$element = Find-PlaywrightPageElement -Label "Username" -Page $page
$element = Find-PlaywrightPageElement -Role "button" -Page $page
```

### Get Locator Information

```powershell
$locator = $page.Locator('#myElement')
$info = Get-PlaywrightLocatorInfo -Locator $locator
```

### Click a Button

```powershell
$button = Find-PlaywrightPageElement -Role "button" -Page $page
Invoke-PlaywrightLocatorClick -Locator $button

$button = Find-PlaywrightPageElement -Role "button" -Page $page
Invoke-PlaywrightLocatorClick -Locator $button
```

### Common Scenarios

- **Assert Element Visibility**

	```powershell
	$locator = $page.Locator('#main')
	Assert-PlaywrightLocator -Locator $locator -IsVisible
	```

- **Get Page Title**
	```powershell
	$title = Get-PlaywrightPageTitle -Page $page
	```

- **Take a Screenshot**
	```powershell
	Get-PlaywrightPageScreenshot -Page $page -Path './screenshot.png'
	```

For more advanced usage and additional examples, see the documentation and upcoming examples section.