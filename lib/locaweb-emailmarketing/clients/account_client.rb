require 'rest_client'

module Locaweb
  module Emailmarketing
    class AccountClient
      include Configuration

      def initialize(options = {})
        validate_and_set_options options
      end

      def all
        do_request "accounts"
      end

      def get(id)
        do_request "accounts/#{id}"
      end

      private

      def do_request uri
        JSON RestClient.get "#{@options[:base_url]}/#{uri}", "X-Auth-Token" => @options[:auth_token], accept: :json
      end
    end
  end
end