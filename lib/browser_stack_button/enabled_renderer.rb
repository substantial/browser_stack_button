require_relative 'button'

module BrowserStackButton
  class EnabledRenderer
    attr_reader :configuration, :button_block

    def initialize(configuration, &block)
      @configuration = configuration
      @button_block = block
    end

    def render_to(context)
      context.render "browser_stack_button/button", button: create_button(context)
    end

    private
    def create_button(context)
      button = BrowserStackButton::Button.new(configuration, context)
      button_block.call button
      button
    end
  end
end
