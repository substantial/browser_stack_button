module BrowserStackButton
  class EnabledRenderer
    attr_reader :configuration

    Configuration = Struct.new(:url_params, :url) do
    end

    def initialize(&block)
      @configuration = default_configuration
      block.call @configuration if block_given?
    end

    def render_to(context)
      context.render "browser_stack_button/button"
    end

    private
    def default_configuration
      Configuration.new({}, nil)
    end
  end
end
