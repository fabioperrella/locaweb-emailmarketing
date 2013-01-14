require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::CustomFieldClient do
  it_should_behave_like "a base client", "custom_fields" do
    let(:requires_keys_to_create) { [:name, :type] }
    let(:requires_keys_to_update) { [:name] }
  end
end