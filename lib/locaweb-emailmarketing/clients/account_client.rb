require 'rest_client'

module Locaweb
  module Emailmarketing
    class AccountClient
      include Configuration

      def initialize(options = {})
        validate_and_set_options options
      end

      def all
        http_get_request "accounts"
      end

      def get(id)
        http_get_request "accounts/#{id}"
      end

      def update(id, attributes = {})
        http_put_request "accounts/#{id}", account: attributes
      end

      private

      def http_get_request uri
        JSON RestClient.get "#{@options[:base_url]}/#{uri}",
                            { "X-Auth-Token" => @options[:auth_token], accept: :json }
      end

      def http_put_request uri, attributes
        RestClient.put "#{@options[:base_url]}/#{uri}",
                            attributes.to_json,
                            { "X-Auth-Token" => @options[:auth_token], content_type: :json }
      end
    end
  end
end