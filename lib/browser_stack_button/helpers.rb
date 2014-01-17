module BrowserStackButton
  module Helpers
    def browser_stack_button
      BrowserStackButton.renderer.render_to(self)
    end
  end
end
