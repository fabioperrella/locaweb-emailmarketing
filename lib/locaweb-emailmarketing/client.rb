module Locaweb
  module Emailmarketing
    class Client

      def initialize(options = {})
        options.assert_valid_keys(:auth_token, :base_url)
        @options = options
        @auth_token = options[:auth_token]
        @base_url = options[:base_url]
      end

      def accounts
        @account ||= AccountClient.new @options
      end

      # def method_missing(method_name, *args)

      #   if method_name =~ /^(\w+)\.(\w+)/
      #     a=1
      #   end
      # end
    end
  end
end