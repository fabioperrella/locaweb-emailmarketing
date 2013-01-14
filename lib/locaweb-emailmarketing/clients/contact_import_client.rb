module Locaweb
  module Emailmarketing
    class ContactImportClient < BaseClient
      def initialize(http_request_adapter, account_id)
        super
        @resource_name = "contact_imports"
        @required_keys_to_create = { required: [:name, :list_tokens, :url], optional: [:description] }
      end

      def update(*args)
        raise(NotImplementedError, "Unavailable action to this resource")
      end

      def destroy(*args)
        raise(NotImplementedError, "Unavailable action to this resource")
      end
    end
  end
end