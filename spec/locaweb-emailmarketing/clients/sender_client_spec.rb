require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::SenderClient do
  it_should_behave_like "a base client", "senders", [:update] do
    let(:requires_keys_to_create) { [:email] }
  end
end