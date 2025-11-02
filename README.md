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

- `Goto-PlaywrightPage` - Navigate to a URL
- `Reload-PlaywrightPage` - Reload the current page
- `Screenshot-PlaywrightPage` - Take a screenshot of the page
- `Pdf-PlaywrightPage` - Generate a PDF of the page
- `Close-PlaywrightPage` - Close the current page
- `SetContent-PlaywrightPage` - Set the HTML content of the page
- `Title-PlaywrightPage` - Get the title of the page

### Locator Commands

- `Invoke-PlaywrightLocatorClick` - Click an element
- `Set-PlaywrightLocatorInput` - Set input value for an element
- `Set-PlaywrightLocatorSelect` - Select an option in a dropdown
- `Get-PlaywrightLocatorInfo` - Get information about a locator

## Basic Examples

### Start a Browser and Open a Page

```powershell
Start-PlaywrightBrowser -Browser Chromium -Enter
Open-PlaywrightPage -Url "https://playwright.dev/"
```

### Click a Button

```powershell
Get-PlaywrightPageElement -ByText "Submit" | Invoke-PlaywrightLocatorClick
```


For more advanced usage and additional examples, see the documentation and upcoming examples section.