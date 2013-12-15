module BrowserStackButton
  class Configuration
    attr_writer :default_options, :browsers

    def default_options
      @default_options ||= {}
    end

    def browsers
      @browsers ||= {}
    end
  end
end
