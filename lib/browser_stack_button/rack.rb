module BrowserStackButton
  class Rack
    def initialize(app)
      @app = app
    end

    def call(env)
      BrowserStackButton.disable!
      @app.call(env)
    end
  end
end
