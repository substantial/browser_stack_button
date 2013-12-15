require "rails"
require_relative "helpers"

module BrowserStackButton
  class Railtie < ::Rails::Railtie
    initializer 'browser_stack_button' do
      ActiveSupport.on_load(:action_view) do
        ::ActionView::Base.send :include, BrowserStackButton::Helpers
      end
    end
  end
end
