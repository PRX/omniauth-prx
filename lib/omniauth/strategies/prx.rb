require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class PRX < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "PRX"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {:site => "https://www.prx.org"}

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid do
        tmp = raw_info['uid']
        # puts "uid: #{tmp}, raw:#{raw_info.inspect}"
        tmp
      end

      info do
        u = raw_info['info']
        {
          :uid        => raw_info['uid'],
          :login      => u['login'],
          :email      => u['email'],
          :first_name => u['first_name'],
          :last_name  => u['last_name'],
          :accounts   => u['accounts']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= get_raw_info
      end
      
      def get_raw_info
        t = access_token
        # puts "get_raw_info: access_token: #{t.inspect}"
        r = access_token.get('/me', {'Accept' => 'application/json'}).parsed
        # puts "get_raw_info: response: #{r.inspect}"
        r
      end
      
    end
  end
end