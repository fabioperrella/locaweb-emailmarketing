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

      def get(id)
        @http_request_adapter.get "accounts/#{@account_id}/custom_fields/#{id}"
      end

      def create(attributes)
        attributes.assert_required_keys(required: [:name, :type])
        response_json = JSON @http_request_adapter.post "accounts/#{@account_id}/custom_fields", {custom_field: attributes}
        response_json["id"]
      end

      def update(id, attributes)
        attributes.assert_required_keys(required: [:name])
        @http_request_adapter.put "accounts/#{@account_id}/custom_fields/#{id}", {custom_field: attributes}
      end

      def destroy(id)
        @http_request_adapter.delete "accounts/#{@account_id}/custom_fields/#{id}"
      end
    end
  end
end