require 'rest_client'

module Locaweb
  module Emailmarketing
    class AccountClient
      def initialize(options = {})
        #TODO: refactor
        options.assert_valid_keys(:auth_key, :base_url)
        @options = options
        @auth_key = options[:auth_key]
        @base_url = options[:base_url]
      end

      def all
        RestClient.get "#{@base_url}/accounts"
      end
    end
  end
end