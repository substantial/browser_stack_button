module BrowserStackButton
  module Helpers
    def browser_stack_button
      render "browser_stack_button/button"
    end

    def each_browser_stack_browser_and_url
      yield "hello", "world"

    end
  end
end
