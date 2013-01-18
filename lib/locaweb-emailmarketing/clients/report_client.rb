module Locaweb
  module Emailmarketing
    class ReportClient
      def initialize(http_request_adapter, account_id)
        @http_request_adapter = http_request_adapter
        @account_id = account_id
        @resource_name = "messages"
      end

      def overview(message_id)
        @http_request_adapter.get "accounts/#{@account_id}/#{@resource_name}/#{message_id}/overview"
      end

      def openings(message_id)
        @http_request_adapter.get "accounts/#{@account_id}/#{@resource_name}/#{message_id}/openings"
      end
    end
  end
end