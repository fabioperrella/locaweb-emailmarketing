module Locaweb
  module Emailmarketing
    class ContactImportClient < BaseClient
      def initialize(http_request_adapter, account_id)
        super
        resource_name "contact_imports"
        required_keys = { required: [:name, :list_tokens, :url], optional: [:description] }
        required_keys_to_create required_keys
        required_keys_to_update required_keys
      end
    end
  end
end