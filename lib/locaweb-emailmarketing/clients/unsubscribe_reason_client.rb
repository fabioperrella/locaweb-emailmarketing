module Locaweb
  module Emailmarketing
    class UnsubscribeReasonClient < BaseClient
      def initialize(http_request_adapter, account_id)
        super
        resource_name "unsubscribe_reasons"
        required_keys = { required: [:name], optional: [:name] }
        required_keys_to_create required_keys
        required_keys_to_update required_keys
      end
    end
  end
end