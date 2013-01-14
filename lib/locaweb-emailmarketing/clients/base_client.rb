module Locaweb
  module Emailmarketing
    class BaseClient
      def initialize(http_request_adapter, account_id)
        @http_request_adapter = http_request_adapter
        @account_id = account_id
        @resource_name = nil #in plural form, ex: campaigns
        @required_keys_to_update = {optional: [], required: []}
        @required_keys_to_create = {optional: [], required: []}
      end

      def all
        @http_request_adapter.get "accounts/#{@account_id}/#{@resource_name}"
      end

      def get(id)
        @http_request_adapter.get "accounts/#{@account_id}/#{@resource_name}/#{id}"
      end

      def create(attributes)
        attributes.assert_required_keys(@required_keys_to_create)
        response_json = JSON @http_request_adapter.post "accounts/#{@account_id}/#{@resource_name}", {@resource_name.singularize.to_sym => attributes}
        response_json["id"]
      end

      def update(id, attributes)
        attributes.assert_required_keys(@required_keys_to_update)
        @http_request_adapter.put "accounts/#{@account_id}/#{@resource_name}/#{id}", {@resource_name.singularize.to_sym => attributes}
      end

      def destroy(id)
        @http_request_adapter.delete "accounts/#{@account_id}/#{@resource_name}/#{id}"
      end

      private

      def required_keys_to_update(required_keys_to_update)
        @required_keys_to_update = required_keys_to_update
      end

      def required_keys_to_create(required_keys_to_create)
        @required_keys_to_create = required_keys_to_create
      end

      def resource_name(resource_name)
        @resource_name = resource_name
      end
    end
  end
end