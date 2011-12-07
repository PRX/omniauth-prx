# OmniAuth PRX

An upcoming release of PRX (www.prx.org) will provide OAuth2 support for login and access to v2 of the PRX API.

Currently, PRX supports OpenID authentication, and uses an API key for access to V1 of the PRX API.

OmniAuth PRX is based on the OmniAuth-OAuth2 gem template for OAuth2 strategies.

https://github.com/intridea/omniauth-oauth2

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-prx'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::PRX` is an OmniAuth OAuth2 Strategy based on the: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider 'PRX', ENV['PRX_KEY'], ENV['PRX_SECRET']
end
```
To get the key and secret, login to PRX, then visit:
  
http://www.prx.org/oauth_clients

to set-up your client application.

