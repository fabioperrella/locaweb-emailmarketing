module Locaweb
  module Emailmarketing
    module ClientValidations
      def validate_and_set_options(options)
        options.assert_valid_keys(:auth_token, :base_url)
        @options = options
      end

      def validate_attributes(attributes, expected)
        unkown_attributes = attributes.dup
        if expected.has_key? :optional
          expected[:optional].each { |key| unkown_attributes.delete(key) }
        end

        raise ArgumentError.new("unkown attributes: #{unkown_attributes.keys.join(", ")}") if unkown_attributes.present?
        true
      end
    end
  end
end