module Locaweb
  module Emailmarketing
    class SenderClient < BaseClient
      def initialize(http_request_adapter, account_id)
        super
        resource_name "senders"
        required_keys_to_create ({ required: [:email], optional: [] })
      end

      def update(*args)
        raise(NotImplementedError, "Unavailable action to this resource")
      end
    end
  end
end