require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::DomainClient do
  it_should_behave_like "a base client", "domains" do
    let(:requires_keys_to_create) { [:name] }
    let(:requires_keys_to_update) { [:name, :default] }
  end
end