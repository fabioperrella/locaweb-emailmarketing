module Locaweb
  module Emailmarketing
    class CustomFieldClient
      include ClientValidations

      def initialize(options = {})
        validate_and_set_options options
      end

      def all
      end
    end
  end
end