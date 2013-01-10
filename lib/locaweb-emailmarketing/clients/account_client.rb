module Locaweb
  module Emailmarketing
    class AccountClient
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
        attributes.assert_required_keys(optional: [:return_path_domain])
        @http_request_adapter.put "accounts/#{id}", account: attributes
      end
    end
  end
end