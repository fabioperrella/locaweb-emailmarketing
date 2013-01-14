module Locaweb
  module Emailmarketing
    class ContactClient < BaseClient
      def initialize(http_request_adapter, account_id)
        super
        resource_name "contacts"
        required_keys_to_update({required: [:email, :list_tokens], optional: [:custom_fields]})
        required_keys_to_create({required: [:email, :list_ids], optional: [:custom_fields]})
      end
    end
  end
end