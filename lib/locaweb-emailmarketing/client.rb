module Locaweb
  module Emailmarketing
    class Client
      def initialize(options = {})
        options.assert_required_keys(required: [:account_id, :auth_token, :base_url])
        @account_id = options[:account_id]
        options.delete(:account_id)
        @http_request_adapter = HttpRequestAdapter.new options
      end

      def accounts
        @account ||= AccountClient.new @http_request_adapter
      end

      def custom_fields
        @custom_fields ||= CustomFieldClient.new @http_request_adapter, @account_id
      end

      def campaigns
        @campaigns ||= CampaignClient.new @http_request_adapter, @account_id
      end

      def contact_imports
        @contact_imports ||= ContactImportClient.new @http_request_adapter, @account_id
      end

      def lists
        @lists ||= ListClient.new @http_request_adapter, @account_id
      end

      def contacts
        @contacts ||= ContactClient.new @http_request_adapter, @account_id
      end
    end
  end
end