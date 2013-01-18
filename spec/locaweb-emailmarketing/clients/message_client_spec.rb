require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::MessageClient do
  it_should_behave_like "a base client", "messages" do
    let(:requires_keys_to_create) { [:domain_id, :html_body, :list_ids, :name, :sender_name, :sender, :subject, :scheduled_to] }
    let(:requires_keys_to_update) { [] }
  end
end