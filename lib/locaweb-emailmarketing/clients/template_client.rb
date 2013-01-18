module Locaweb
  module Emailmarketing
    class TemplateClient < BaseClient
      def initialize(http_request_adapter, account_id)
        super
        resource_name "templates"
        required_keys_to_create({ required: [:name, :html_body, :text_body], optional: [] })
        required_keys_to_update({ required: [], optional: [:name, :html_body, :text_body] })
      end
    end
  end
end