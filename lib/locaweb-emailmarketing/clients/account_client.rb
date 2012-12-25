require 'rest_client'

module Locaweb
  module Emailmarketing
    class AccountClient
      def initialize(auth_key)
        @auth_key = auth_key
      end

      def all
        [] #TODO
      end
    end
  end
end