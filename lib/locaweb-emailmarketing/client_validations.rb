module Locaweb
  module Emailmarketing
    module ClientValidations
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