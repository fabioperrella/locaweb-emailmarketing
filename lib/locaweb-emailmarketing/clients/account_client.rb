module Locaweb
  module Emailmarketing
    class AccountClient
      include ClientValidations

      def initialize(options = {})
        @http_request_adapter = HttpRequestAdapter.new options
      end

      def all
        @http_request_adapter.get "accounts"
      end

      def get(id)
        @http_request_adapter.get "accounts/#{id}"
      end

      def update(id, attributes = {})
        validate_attributes(attributes, optional: [:return_path_domain])
        @http_request_adapter.put "accounts/#{id}", account: attributes
      end
    end
  end
end