module Locaweb
  module Emailmarketing
    class DomainClient < BaseClient
      def initialize(http_request_adapter, account_id)
        super
        resource_name "domains"
        required_keys_to_update({required: [:name, :default], optional: []})
        required_keys_to_create({required: [:name], optional: []})
      end
    end
  end
end