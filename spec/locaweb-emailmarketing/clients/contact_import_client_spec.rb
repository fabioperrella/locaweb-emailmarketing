require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::ContactImportClient do
  it_should_behave_like "a base client", "contact_imports", [:update, :destroy] do
    let(:requires_keys_to_create) { [:name, :list_tokens, :url] }
  end
end