# PSPlaywright

> **Work in Progress & Experimentation**
>
> This project is currently a work in progress and serves as an experiment in using GitHub Copilot to generate PowerShell modules for browser automation. The code, structure, and documentation are actively evolving as new features and improvements are explored. Feedback and contributions are welcome!

PSPlaywright is a PowerShell module that provides a set of commands for browser automation and web testing using [Microsoft Playwright](https://playwright.dev/). It enables users to control browsers, interact with web pages, and automate UI testing scenarios directly from PowerShell scripts.

## About Microsoft Playwright

Microsoft Playwright is a Node.js library for browser automation. It supports Chromium, Firefox, and WebKit, allowing for cross-browser web automation and testing. Playwright enables reliable end-to-end testing for modern web applications, supporting features like headless execution, network interception, and advanced page interactions.

## Commands

### Browser Commands

- `Start-PlaywrightBrowser` - Start a new browser instance
- `Stop-PlaywrightBrowser` - Stop the browser instance
- `Enter-PlaywrightBrowser` - Enter a browser context
- `Exit-PlaywrightBrowser` - Exit the browser context
- `Open-PlaywrightPage` - Open a new page in the browser

### Page Commands

The following Page cmdlets are available:

- `Add-PlaywrightPageInitScript` - Add an initialization script to the page
- `Add-PlaywrightPageLocatorHandler` - Add a locator handler to the page
- `Set-PlaywrightPageToFront` - Bring the page to the front
- `Close-PlaywrightPage` - Close the current page
- `Get-PlaywrightPageContent` - Get the content of the page
- `Set-PlaywrightPageDragAndDrop` - Perform drag and drop on the page
- `Set-PlaywrightPageMedia` - Emulate media features on the page
- `Enter-PlaywrightPage` - Enter the page context
- `Get-PlaywrightPageJavascriptHandle` - Evaluate JavaScript and get a handle
- `Exit-PlaywrightPage` - Exit the page context
- `Get-PlaywrightPageLocator` - Get a locator from the page
- `Open-PlaywrightPageUrl` - Navigate to a URL
- `Invoke-PlaywrightPageJavascript` - Invoke JavaScript on the page
- `Invoke-PageKeyboard` - Send keyboard input to the page
- `Get-PlaywrightPageOpener` - Get the opener of the page
- `Invoke-PlaywrightPageNavigation` - Handle page navigation
- `Suspend-PlaywrightPage` - Pause the page
- `Get-PlaywrightPagePdf` - Generate a PDF of the page
- `Reset-PlaywrightPage` - Reload the current page
- `Remove-PlaywrightPageLocatorHandler` - Remove a locator handler from the page
- `Invoke-PlaywrightPageGarageCollection` - Request garbage collection on the page
- `Invoke-PlaywrightPageRequest` - Route requests from a HAR file
- `Register-PlaywrightPageRouteHandler` - Route network requests on the page
- `Invoke-PlaywrightPageRunAndWaitForEvent` - Run and wait for a page event
- `Get-PlaywrightPageScreenshot` - Take a screenshot of the page
- `Set-PlaywrightPageContent` - Set the HTML content of the page
- `Set-PlaywrightPageViewportSize` - Set the viewport size of the page
- `Get-PlaywrightPageTitle` - Get the title of the page
- `Unregister-PlaywrightPageRoute` - Remove all routes from the page
- `Wait-PlaywrightPageEvent` - Wait for a page event

### Locator Commands

- `Invoke-PlaywrightLocatorClick` - Click an element
- `Set-PlaywrightLocatorInput` - Set input value for an element
- `Set-PlaywrightLocatorSelect` - Select an option in a dropdown
- `Get-PlaywrightLocatorInfo` - Get information about a locator



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