require 'rest_client'

module Locaweb
  module Emailmarketing
    class AccountClient
      def initialize(options = {})
        #TODO: refactor
        options.assert_valid_keys(:auth_token, :base_url)
        @options = options
        @auth_token = options[:auth_token]
        @base_url = options[:base_url]
      end

      def all
        response = RestClient.get "#{@base_url}/accounts", "X-Auth-Token" => @auth_token, accept: :json
        JSON response
      end
    end
  end
end