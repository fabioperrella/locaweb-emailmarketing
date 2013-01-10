require 'rest_client'

module Locaweb
  module Emailmarketing
    class HttpRequestAdapter
      def initialize(options)
        #TODO: validate options
        @options = options
      end

      def get uri
        JSON RestClient.get "#{@options[:base_url]}/#{uri}",
                            { "X-Auth-Token" => @options[:auth_token], accept: :json }
      end

      def put uri, attributes
        RestClient.put "#{@options[:base_url]}/#{uri}",
                            attributes.to_json,
                            { "X-Auth-Token" => @options[:auth_token], content_type: :json }
      end
    end
  end
end