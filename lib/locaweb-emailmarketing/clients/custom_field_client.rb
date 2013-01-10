require 'rest_client'

module Locaweb
  module Emailmarketing
    class CustomFieldClient
      include ClientValidations

      def initialize(options = {})
        validate_and_set_options options
      end
    end
  end
end