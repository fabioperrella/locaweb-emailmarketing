require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::UnsubscribeReasonClient do
  it_should_behave_like "a base client", "unsubscribe_reasons" do
    let(:requires_keys_to_create) { [:name] }
    let(:requires_keys_to_update) { [:name] }
  end
end