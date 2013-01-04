module Locaweb
  module Emailmarketing
    class Client
      include Configuration

      def initialize(options = {})
        validate_and_set_options options
      end

      def accounts
        @account ||= AccountClient.new @options
      end

    end
  end
end