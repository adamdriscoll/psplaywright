using System.Collections.Generic;
using Microsoft.Playwright;

namespace psplaywright
{
	public class PlaywrightContext : IDisposable
	{
	    public IPlaywright? Playwright { get; set; }
		public Stack<IBrowser> Browsers { get; } = new Stack<IBrowser>();
		public Stack<IPage> Pages { get; } = new Stack<IPage>();

		public void Dispose()
		{
			// Dispose of Playwright and all associated resources
            while (Browsers.Count > 0)
            {
                var browser = Browsers.Pop();
                browser.CloseAsync().GetAwaiter().GetResult();
            }

            while (Pages.Count > 0)
            {
                var page = Pages.Pop();
                page.CloseAsync().GetAwaiter().GetResult();
            }

            Playwright?.Dispose();
            Playwright = null;
		}


		// Enter a new browser (push to stack)
		public void EnterBrowser(IBrowser browser)
		{
			Browsers.Push(browser);
		}

		// Exit current browser (pop from stack)
		public IBrowser ExitBrowser()
		{
			if (Browsers.Count > 0)
				return Browsers.Pop();
			return null;
		}

		// Enter a new page (push to stack)
		public void EnterPage(IPage page)
		{
			Pages.Push(page);
		}

		// Exit current page (pop from stack)
		public IPage? ExitPage()
		{
			if (Pages.Count > 0)
				return Pages.Pop();
			return null;
		}

		// Close and remove the current browser
		public void CloseCurrentBrowser()
		{
			if (Browsers.Count > 0)
			{
				var browser = Browsers.Pop();
				browser.CloseAsync().GetAwaiter().GetResult();
			}
		}

		// Close and remove the current page
		public void CloseCurrentPage()
		{
			if (Pages.Count > 0)
			{
				var page = Pages.Pop();
				page.CloseAsync().GetAwaiter().GetResult();
			}
		}

		// Close and remove a specific browser from the stack
		public void CloseAndRemoveBrowser(IBrowser browser)
		{
			var tempStack = new Stack<IBrowser>();
			bool found = false;
			while (Browsers.Count > 0)
			{
				var b = Browsers.Pop();
				if (b == browser && !found)
				{
					b.CloseAsync().GetAwaiter().GetResult();
					found = true;
				}
				else
				{
					tempStack.Push(b);
				}
			}
			while (tempStack.Count > 0)
			{
				Browsers.Push(tempStack.Pop());
			}
		}

		// Close and remove a specific page from the stack
		public void CloseAndRemovePage(IPage page)
		{
			var tempStack = new Stack<IPage>();
			bool found = false;
			while (Pages.Count > 0)
			{
				var p = Pages.Pop();
				if (p == page && !found)
				{
					p.CloseAsync().GetAwaiter().GetResult();
					found = true;
				}
				else
				{
					tempStack.Push(p);
				}
			}
			while (tempStack.Count > 0)
			{
				Pages.Push(tempStack.Pop());
			}
		}
	}
}
