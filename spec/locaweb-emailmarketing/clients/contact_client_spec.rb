require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::ContactClient do
  it_should_behave_like "a base client", "contacts" do
    let(:requires_keys_to_create) { [:email, :list_ids] }
    let(:requires_keys_to_update) { [] }
  end
end