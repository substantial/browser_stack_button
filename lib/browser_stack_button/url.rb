require "cgi"

module BrowserStackButton
  class Url
    def initialize(url, options={})
      params = options.map {|k,v| "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"}.join("&")

      @url = "http://www.browserstack.com/start##{params}"
    end

    def to_s
      @url
    end
  end
end
