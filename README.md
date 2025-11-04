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

### Getting Started

#### Basic Browser Setup

Start a browser session and navigate to a webpage:

```powershell
# Start Playwright and launch a Chromium browser in headless mode
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Headless -Enter

# Open a new page and navigate to a URL
Open-PlaywrightPage -Url "https://playwright.dev/"

# Get the page title
$title = Get-PlaywrightPageTitle
Write-Host "Page title: $title"

# Clean up
Exit-PlaywrightBrowser
Stop-Playwright
```

#### Interactive Browser Session

Launch a visible browser for debugging and manual interaction:

```powershell
# Start browser with visible window (non-headless)
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter

# Open a page and pause for manual inspection
Open-PlaywrightPage -Url "https://example.com"
Suspend-PlaywrightPage  # Opens Playwright Inspector for debugging

# Continue automation after inspection
Exit-PlaywrightBrowser
Stop-Playwright
```

### Web Navigation & Content

#### Navigate and Interact with Pages

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Headless -Enter

# Open a page
Open-PlaywrightPage -Url "https://www.bing.com"

# Get page content
$content = Get-PlaywrightPageContent
Write-Host "Page HTML length: $($content.Length) characters"

# Take a screenshot
Get-PlaywrightPageScreenshot -Path ".\bing-homepage.png" -FullPage

# Navigate to another page
Open-PlaywrightPageUrl -Url "https://github.com"

# Go back
Invoke-PlaywrightPageNavigation -Action GoBack

# Reload the page
Reset-PlaywrightPage

Exit-PlaywrightBrowser
Stop-Playwright
```

#### Set Custom Content

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter

Open-PlaywrightPage -Url "about:blank"

# Set custom HTML content
$html = @"
<!DOCTYPE html>
<html>
<head><title>Test Page</title></head>
<body>
    <h1>Hello from PowerShell!</h1>
    <button id="myButton">Click Me</button>
</body>
</html>
"@

Set-PlaywrightPageContent -Html $html

# Take a screenshot of custom content
Get-PlaywrightPageScreenshot -Path ".\custom-page.png"

Exit-PlaywrightBrowser
Stop-Playwright
```

### Finding & Interacting with Elements

#### Find Elements Using Different Selectors

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter
Open-PlaywrightPage -Url "https://github.com/login"

# Find by role (accessibility)
$loginButton = Find-PlaywrightPageElement -Role "button" -Name "Sign in"

# Find by label (form fields)
$usernameField = Find-PlaywrightPageElement -Label "Username or email address"

# Find by placeholder text
$searchBox = Find-PlaywrightPageElement -Placeholder "Search GitHub"

# Find by text content
$linkElement = Find-PlaywrightPageElement -Text "Create an account"

# Find by alt text (images)
$logo = Find-PlaywrightPageElement -AltText "GitHub"

Exit-PlaywrightBrowser
Stop-Playwright
```

#### Click Elements

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter
Open-PlaywrightPage -Url "https://example.com"

# Find and click a button
$button = Find-PlaywrightPageElement -Role "button" -Name "Submit"
Invoke-PlaywrightLocatorClick -Locator $button

# Click with options (double-click, right-click, etc.)
$element = Find-PlaywrightPageElement -Role "link" -Name "More info"
Invoke-PlaywrightLocatorClick -Locator $element -ClickCount 2  # Double-click

Exit-PlaywrightBrowser
Stop-Playwright
```

### Form Automation

#### Fill Out and Submit a Form

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter
Open-PlaywrightPage -Url "https://example.com/contact"

# Fill text inputs
$nameField = Find-PlaywrightPageElement -Label "Name"
Set-PlaywrightLocatorInput -Locator $nameField -Value "John Doe"

$emailField = Find-PlaywrightPageElement -Label "Email"
Set-PlaywrightLocatorInput -Locator $emailField -Value "john@example.com"

$messageField = Find-PlaywrightPageElement -Label "Message"
Set-PlaywrightLocatorInput -Locator $messageField -Value "This is a test message from PSPlaywright!"

# Select from dropdown
$countryDropdown = Find-PlaywrightPageElement -Label "Country"
Set-PlaywrightLocatorSelect -Locator $countryDropdown -Value "USA"

# Submit the form
$submitButton = Find-PlaywrightPageElement -Role "button" -Name "Submit"
Invoke-PlaywrightLocatorClick -Locator $submitButton

# Wait for navigation or success message
Start-Sleep -Seconds 2

Exit-PlaywrightBrowser
Stop-Playwright
```

### Assertions & Testing

#### Verify Element States

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter
Open-PlaywrightPage -Url "https://example.com"

# Assert element is visible
$header = Find-PlaywrightPageElement -Role "heading" -Name "Example Domain"
Assert-PlaywrightLocator -Locator $header -IsVisible

# Assert element contains text
$paragraph = Find-PlaywrightPageElement -Role "paragraph"
Assert-PlaywrightLocator -Locator $paragraph -ContainsText "This domain is for use"

# Assert element is enabled
$button = Find-PlaywrightPageElement -Role "button"
Assert-PlaywrightLocator -Locator $button -IsEnabled

# Assert element count
$links = Find-PlaywrightPageElement -Role "link"
Assert-PlaywrightLocator -Locator $links -Count 1

Exit-PlaywrightBrowser
Stop-Playwright
```

### Advanced Scenarios

#### Keyboard & Mouse Interactions

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter
Open-PlaywrightPage -Url "https://www.google.com"

# Type text using keyboard
Invoke-PlaywrightPageKeyboard -Action Type -Text "PowerShell automation"

# Press specific keys
Invoke-PlaywrightPageKeyboard -Action Press -Key "Enter"

# Use keyboard shortcuts
Invoke-PlaywrightPageKeyboard -Action Press -Key "Control+A"  # Select all

# Mouse interactions
Invoke-PlaywrightPageMouse -Action Click -X 100 -Y 200
Invoke-PlaywrightPageMouse -Action Move -X 300 -Y 400

Exit-PlaywrightBrowser
Stop-Playwright
```

#### Generate PDF from Webpage

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter
Open-PlaywrightPage -Url "https://playwright.dev/"

# Generate PDF with custom options
Get-PlaywrightPagePdf -Path ".\playwright-docs.pdf" -Format "A4" -PrintBackground

Exit-PlaywrightBrowser
Stop-Playwright
```

#### Execute JavaScript

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter
Open-PlaywrightPage -Url "https://example.com"

# Execute JavaScript on the page
$result = Invoke-PlaywrightPageJavascript -Script "return document.title;"
Write-Host "Page title from JS: $result"

# Execute more complex JavaScript
$links = Invoke-PlaywrightPageJavascript -Script @"
    return Array.from(document.querySelectorAll('a')).map(a => a.href);
"@
Write-Host "Found $($links.Count) links"

Exit-PlaywrightBrowser
Stop-Playwright
```

#### Viewport & Media Emulation

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter
Open-PlaywrightPage -Url "https://example.com"

# Set viewport size (mobile device simulation)
Set-PlaywrightPageViewportSize -Width 375 -Height 667

# Emulate media features
Set-PlaywrightPageMedia -ColorScheme "dark" -ReducedMotion "reduce"

# Take screenshot with mobile viewport
Get-PlaywrightPageScreenshot -Path ".\mobile-view.png"

Exit-PlaywrightBrowser
Stop-Playwright
```

#### Wait for Events

```powershell
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Enter
Open-PlaywrightPage -Url "https://example.com"

# Click a link and wait for navigation
$link = Find-PlaywrightPageElement -Role "link"
Invoke-PlaywrightLocatorClick -Locator $link

# Wait for a specific event
Wait-PlaywrightPageEvent -Event "load" -Timeout 30000

Exit-PlaywrightBrowser
Stop-Playwright
```

### Multi-Browser Testing

#### Test Across Different Browsers

```powershell
Start-Playwright

$browsers = @('Chromium', 'Firefox', 'Webkit')
$results = @()

foreach ($browser in $browsers) {
    Write-Host "Testing with $browser..."
    
    Start-PlaywrightBrowser -BrowserType $browser -Headless -Enter
    Open-PlaywrightPage -Url "https://example.com"
    
    # Perform tests
    $title = Get-PlaywrightPageTitle
    $screenshot = ".\test-$browser.png"
    Get-PlaywrightPageScreenshot -Path $screenshot
    
    $results += [PSCustomObject]@{
        Browser = $browser
        Title = $title
        Screenshot = $screenshot
    }
    
    Exit-PlaywrightBrowser
}

# Display results
$results | Format-Table -AutoSize

Stop-Playwright
```

### Complete Example: Web Scraping

```powershell
# Scrape article titles from a news website
Start-Playwright
Start-PlaywrightBrowser -BrowserType Chromium -Headless -Enter

Open-PlaywrightPage -Url "https://news.ycombinator.com"

# Wait for content to load
Start-Sleep -Seconds 2

# Execute JavaScript to extract article titles
$titles = Invoke-PlaywrightPageJavascript -Script @"
    return Array.from(document.querySelectorAll('.titleline > a'))
        .map(a => ({
            title: a.textContent,
            url: a.href
        }))
        .slice(0, 10);
"@

# Display results
Write-Host "Top 10 Articles:`n"
$titles | ForEach-Object {
    Write-Host "- $($_.title)"
    Write-Host "  URL: $($_.url)`n"
}

Exit-PlaywrightBrowser
Stop-Playwright
```

## Additional Resources

For detailed information about each command and its parameters, refer to the command documentation links in the [Commands](#commands) section above.

For more information about Playwright capabilities, visit the [official Playwright documentation](https://playwright.dev/).
