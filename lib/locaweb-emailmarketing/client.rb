module Locaweb
  module Emailmarketing
    class Client
      include ClientValidations

      def initialize(options = {})
        @http_request_adapter = HttpRequestAdapter.new options
      end

      def accounts
        @account ||= AccountClient.new @http_request_adapter
      end

    end
  end
end