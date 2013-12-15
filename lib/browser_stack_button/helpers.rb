require_relative "url"

module BrowserStackButton
  module Helpers
    def browser_stack_button
      render "browser_stack_button/button"
    end

    def each_browser_stack_browser_and_url
      BrowserStackButton.configuration.browsers.each do |name, options|
        options = BrowserStackButton.configuration.default_options.merge options
        options[:url] = browser_stack_current_url
        yield name, BrowserStackButton::Url.new(options).to_s
      end
    end

    private
    def browser_stack_current_url
      url_options = params.merge(
        only_path: false,
      )

      url_for(url_options)
    end
  end
end
