## Todos

    - Run test files using `Invoke-Pester` one at a time
    - If a test fails, fix the issue before moving on to the next test
    - Rerun that test until it passes
    - Reference the working tests for guidance

I want to ensure all my tests are functional. Please run `Invoke-Pester` on each test file in order. If they do not succeed, please fix the issue.If a test fails, focus on fixing that test first before moving on to the next one. If the terminal blocks, that is an indication a parameter is not specified. We should either specify the parameter or remove the test because it is invalid.

Do not try to run the test files directly. Instead, use the `Invoke-Pester` command from the PowerShell Pester module to run the tests. For example:

```
Invoke-Pester -Path .\Playwright.Tests\Browser\StartPlaywrightBrowserCOmmmand.Tests.ps1
```

Tests are found in the `Playwright.Tests` folder. Working tests you can use as a reference include.

- AssertLocatorCommand.Tests.ps1
- GotoPageCommand.Tests.ps1