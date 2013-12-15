require_relative "url"

module BrowserStackButton
  module Helpers
    def browser_stack_button
      render "browser_stack_button/button"
    end

    def each_browser_stack_browser_and_url
      BrowserStackButton.configuration.browsers.each do |name, options|
        options = BrowserStackButton.configuration.default_options.merge options
        yield name, BrowserStackButton::Url.new("http://google.com", options).to_s
      end
    end
  end
end
