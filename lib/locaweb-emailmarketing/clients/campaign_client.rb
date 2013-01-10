module Locaweb
  module Emailmarketing
    class CampaignClient
      def initialize(http_request_adapter, account_id)
        @http_request_adapter = http_request_adapter
        @account_id = account_id
        @resource_name = "campaigns"
      end

      def all
        @http_request_adapter.get "accounts/#{@account_id}/#{@resource_name}"
      end

      def get(id)
        @http_request_adapter.get "accounts/#{@account_id}/#{@resource_name}/#{id}"
      end

      def create(attributes)
        attributes.assert_required_keys(required: [:name], optional:[:description])
        response_json = JSON @http_request_adapter.post "accounts/#{@account_id}/#{@resource_name}", {campaign: attributes}
        response_json["id"]
      end

      def update(id, attributes)
        attributes.assert_required_keys(required: [:name], optional: [:description])
        @http_request_adapter.put "accounts/#{@account_id}/#{@resource_name}/#{id}", {campaign: attributes}
      end

      def destroy(id)
        @http_request_adapter.delete "accounts/#{@account_id}/#{@resource_name}/#{id}"
      end
    end
  end
end