module Locaweb
  module Emailmarketing
    class ReportClient
      def initialize(http_request_adapter, account_id)
        @http_request_adapter = http_request_adapter
        @account_id = account_id
        @resource_name = "messages"
      end

      def overview(message_id)
        do_report_request message_id, "overview"
      end

      def openings(message_id)
        do_report_request message_id, "openings"
      end

      def uniq_openings(message_id)
        do_report_request message_id, "uniq_openings"
      end

      def links(message_id)
        do_report_request message_id, "links"
      end

      private

      def do_report_request(message_id, report_name)
        @http_request_adapter.get "accounts/#{@account_id}/#{@resource_name}/#{message_id}/#{report_name}"
      end
    end
  end
end