module Locaweb
  module Emailmarketing
    class Client
      def initialize(auth_key)
        @auth_key = auth_key
      end

      def accounts
        @account ||= AccountClient.new @auth_key
      end

      # def method_missing(method_name, *args)

      #   if method_name =~ /^(\w+)\.(\w+)/
      #     a=1
      #   end
      # end
    end
  end
end