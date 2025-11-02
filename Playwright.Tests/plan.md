## Todos

    - Run test files using `Invoke-Pester` one at a time
    - If a test fails, fix the issue before moving on to the next test
    - Rerun that test until it passes
    - Reference the working tests for guidance

I want to ensure all my tests are functional. Please run `Invoke-Pester` on each test file in order. If they do not succeed, please fix the issue.If a test fails, focus on fixing that test first before moving on to the next one. If the terminal blocks, that is an indication a parameter is not specified. We should either specify the parameter or remove the test because it is invalid.

If a test passes add it to the list of passing tests below.

Do not update the module to fix the tests. The goal is to have all tests pass with the current module code.

Do not try to run the test files directly. Instead, use the `Invoke-Pester` command from the PowerShell Pester module to run the tests. For example:

```powershell
Invoke-Pester -Path .\Playwright.Tests\Browser\StartPlaywrightBrowserCOmmmand.Tests.ps1
```

Tests are found in the `Playwright.Tests` folder. Working tests you can use as a reference include. Do not run these tests again, they are just for reference.

Passing Tests:

 - AssertLocatorCommand.Tests.ps1
 - GotoPageCommand.Tests.ps1
 - StartPlaywrightBrowserCommand.Tests.ps1
 - InvokePlaywrightLocatorClickCommand.Tests.ps1
 - SetPlaywrightLocatorInputCommand.Tests.ps1
 - InvokePageKeyboardCommand.Tests.ps1
 - InvokePageMouseCommand.Tests.ps1
 - SetViewportSizePageCommand.Tests.ps1
 - TitlePageCommand.Tests.ps1
 - OpenerPageCommand.Tests.ps1
 - PausePageCommand.Tests.ps1
 - PageNavigationCommand.Tests.ps1
 - PdfPageCommand.Tests.ps1
 - ReloadPageCommand.Tests.ps1
 - RequestGCPageCommand.Tests.ps1
 - RouteFromHARPageCommand.Tests.ps1
 - RemoveLocatorHandlerPageCommand.Tests.ps1
 - ScreenshotPageCommand.Tests.ps1
 - WaitForPageEventCommand.Tests.ps1

Remove tests that check for mandatory parameters because they will cause the tests to hang. An example is below.

```powershell
It 'Should require Locator and Value parameters' {
    { Set-PlaywrightLocatorInput } | Should -Throw
}
```

If you encounter issues with a test not finding commands, it's likely the module is not being imported properly.

To fix this, add the following line at the top of the test file, adjusting the path as necessary. The TestHtmlHelpers.psm1 file is located in the Playwright.Tests folder. When in a nested folder, you may need to use `..\` to navigate up a directory.

```powershell
Import-Module "$PSScriptRoot\..\TestHtmlHelpers.psm1"
```