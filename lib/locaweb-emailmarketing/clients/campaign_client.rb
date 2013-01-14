module Locaweb
  module Emailmarketing
    class CampaignClient < BaseClient
      def initialize(http_request_adapter, account_id)
        super
        resource_name "campaigns"
        required_keys = {required: [:name], optional: [:description]}
        required_keys_to_update required_keys
        required_keys_to_create required_keys
      end
    end
  end
end