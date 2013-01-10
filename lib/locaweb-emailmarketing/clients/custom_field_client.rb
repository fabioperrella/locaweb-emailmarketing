module Locaweb
  module Emailmarketing
    class CustomFieldClient
      def initialize(http_request_adapter, account_id)
        @http_request_adapter = http_request_adapter
        @account_id = account_id
      end

      def all
        @http_request_adapter.get "accounts/#{@account_id}/custom_fields"
      end
    end
  end
end