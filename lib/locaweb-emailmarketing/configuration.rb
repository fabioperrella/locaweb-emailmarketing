module Locaweb
  module Emailmarketing
    module Configuration
      def validate_and_set_options(options)
        options.assert_valid_keys(:auth_token, :base_url)
        @options = options
      end
    end
  end
end