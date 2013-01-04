require 'rest_client'

module Locaweb
  module Emailmarketing
    class AccountClient
      include Configuration

      def initialize(options = {})
        validate_and_set_options options
      end

      def all
        response = RestClient.get "#{@options[:base_url]}/accounts", "X-Auth-Token" => @options[:auth_token], accept: :json
        JSON response
      end
    end
  end
end