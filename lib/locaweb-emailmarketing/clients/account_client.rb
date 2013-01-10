module Locaweb
  module Emailmarketing
    class AccountClient
      include ClientValidations

      def initialize(http_request_adapter)
        @http_request_adapter = http_request_adapter
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