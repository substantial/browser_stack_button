require_relative "browser_stack_button/version"
require_relative "browser_stack_button/railtie"
require_relative "browser_stack_button/engine"
require_relative "browser_stack_button/configuration"
require_relative "browser_stack_button/disabled_renderer"
require_relative "browser_stack_button/enabled_renderer"

module BrowserStackButton
  class << self
    def renderer
      Thread.current[:browser_stack_button_renderer] ||= DisabledRenderer.new
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

    def disable!
      self.renderer = DisabledRenderer.new
    end

    def enable!(&block)
      self.renderer = EnabledRenderer.new(configuration, &block)
    end

    private
    def renderer=(renderer)
      Thread.current[:browser_stack_button_renderer] = renderer
    end
  end
end
