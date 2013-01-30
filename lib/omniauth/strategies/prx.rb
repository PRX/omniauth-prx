require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Prx < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "prx"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {:site => "https://www.prx.org"}

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info['id'].to_s }

      info do
        {
          :name       => "#{raw_info['first_name']} #{raw_info['last_name']}",
          :nickname   => raw_info['login'],
          :email      => raw_info['email'],
          :first_name => raw_info['first_name'],
          :last_name  => raw_info['last_name'],
          :urls       => {"Profile" => "http://www.prx.org/users/#{raw_info['id']}#{raw_info['login']}"}
        }
      end

      extra do
        {
          :raw_info   => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me', {'Accept' => 'application/json'}).parsed['info']
      end
    end

    # Alias for backward compatibility
    PRX = Prx
  end
end