module BrowserStackButton
  module Helpers
    def browser_stack_button
      render "browser_stack_button/button"
    end

    def each_browser_stack_browser_and_url
      BrowserStackButton.configuration.browsers.each do |name, options|
        yield name, "world"
      end
    end
  end
end
