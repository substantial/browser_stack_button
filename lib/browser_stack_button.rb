require_relative "browser_stack_button/version"
require_relative "browser_stack_button/railtie"
require_relative "browser_stack_button/engine"
require_relative "browser_stack_button/configuration"

module BrowserStackButton
  def self.configuration
    @configuration ||= BrowserStackButton::Configuration.new
  end

  def self.configure
    yield configuration
  end
end
