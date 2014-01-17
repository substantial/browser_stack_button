require 'rails'

module BrowserStackButton #:nodoc:
  class Engine < ::Rails::Engine #:nodoc:
    initializer "browser_stack_button.assets.precompile" do |app|
      app.config.assets.precompile += %w[
        browser_stack_button.png
        browser_stack_button.js
        browser_stack_button.css
      ]
    end
  end
end
