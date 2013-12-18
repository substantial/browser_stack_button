require "rails"
require_relative "helpers"
require_relative "rack"

module BrowserStackButton
  class Railtie < ::Rails::Railtie
    initializer 'browser_stack_button' do |app|
      ActiveSupport.on_load(:action_view) do
        ::ActionView::Base.send :include, BrowserStackButton::Helpers
      end

      app.middleware.insert(0, BrowserStackButton::Rack)
    end
  end
end
