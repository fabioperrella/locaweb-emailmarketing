require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::TemplateClient do
  it_should_behave_like "a base client", "templates" do
    let(:requires_keys_to_create) { [:name, :html_body, :text_body] }
    let(:requires_keys_to_update) { [] }
  end
end