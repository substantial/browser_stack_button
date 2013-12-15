# BrowserStackButton

BrowserStackButton adds a button to your page to allow you to quickly and
easily view the page you are looking at in BrowserStack.

## Installation

Add this line to your application's Gemfile:

    gem 'browser_stack_button'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install browser_stack_button

## Configuration

Put your configuration in an initializer:

`config/initializers/browser_stack_button.rb`

```ruby
BrowserStackButton.configure do |config|
  # ...
end
```

### Browser configuration

By default BrowserStackButton will not render any buttons for any browsers.
You need to set them up as described below.
TODO: NEED LINK
Refer to the [Browser Stack API documentation]() for what each setting means.

#### Default options

These options are applied to all browsers, but can be overridden by the
individual browser settings.

```ruby
  config.default_browser_options = {
    os: "Windows",
    start: "true",
    speed: "2",
    zoom_to_fit: "false",
    resolution: "1024x768",
    full_screen: "true",
  }
```

#### Configuring browsers

```ruby
  config.browsers["IE8"] = { browser: "IE", browser_version: "8.0", os_version: "7" }
  config.browsers["IE9"] = { browser: "IE", browser_version: "9.0", os_version: "7" }
  config.browsers["IE10"] = { browser: "IE", browser_version: "10.0+Desktop", os_version: "8" }
  config.browsers["Firefox"] = { browser: "Firefox", browser_version: "22.0", os_version: "7" }
  config.browsers["Safari"] = { browser: "Safari", browser_version: "6.0", os: "OS X", os_version: "Mountain Lion" }
  config.browsers["Chrome"] = { browser: "Chrome", browser_version: "28.0", os_version: "7" }
```

## Usage

Add the following just after your opening body tag:

```erb
<%= browser_stack_button %>
```

If you want to enable it, likely only on a staging server, you can call
call `BrowserStackButton.enable!` in a `before_filter` or in your controller
action.

You could enable it on production for just admin users or whatever you like. We
only use it on our staging server. 

Sometimes you need to add additional parameters to your site url that is
visited by BrowserStack. We use this for a login backdoor on our staging server
which allows us to view the page as the same user we are currently logged in
as. To do this, pass an additional hash to `enable!`:

```ruby
BrowserStackButton.enable! do |button|
  # Add additional params to the url
  if user_signed_in?
    button.url_params[:backdoor] = current_user.email
  else
    button.url_params[:backdoor] = "anonymous"
  end

  # OR override the URL entirely
  browser.url = "http://example.com"
end
```

Once enabled, you should see a BrowserStack logo in the top left of the page.
Click it to reveal a dropdown and select a browser. You will need to enable
popups When changing browsers, it is best to close the previous browser window
before clicking the next one.

## Todo

* Localhost/Tunnel support
* Extract more to javascript so it is usable outside of a Rails project.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/browser_stack_button/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
