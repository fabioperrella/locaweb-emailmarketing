module Locaweb
  module Emailmarketing
    class CustomFieldClient < BaseClient
      def initialize(http_request_adapter, account_id)
        super
        resource_name "custom_fields"
        required_keys_to_update({ required: [:name] })
        required_keys_to_create({ required: [:name, :type] })
      end
    end
  end
end