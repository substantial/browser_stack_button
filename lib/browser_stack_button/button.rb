require_relative "url"

module BrowserStackButton
  class Button
    attr_reader :configuration, :context, :url_params
    attr_accessor :url

    def initialize(configuration, context)
      @configuration = configuration
      @context = context
      @url_params = {}
    end

    def each_browser_and_url
      configuration.browsers.each do |name, options|
        options = configuration.default_options.merge options
        options[:url] = browser_stack_current_url
        yield name, BrowserStackButton::Url.new(options).to_s
      end
    end

    private
    def browser_stack_current_url
      return url if url

      url_options = context.params.merge(
        only_path: false,
      ).merge(url_params)

      context.url_for(url_options)
    end
  end
end
