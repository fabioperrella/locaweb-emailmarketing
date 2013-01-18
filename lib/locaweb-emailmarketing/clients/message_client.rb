module Locaweb
  module Emailmarketing
    class MessageClient < BaseClient
      def initialize(http_request_adapter, account_id)
        super
        resource_name "messages"
        required_keys = {required: [:domain_id, :html_body, :list_ids, :name, :sender_name, :sender, :subject, :scheduled_to], optional: [:text_body] }
        required_keys_to_create required_keys
        required_keys_to_update({required: [], optional: required_keys[:optional] + required_keys[:required] })
      end
    end
  end
end