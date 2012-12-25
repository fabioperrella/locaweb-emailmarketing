require 'spec_helper'
include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::AccountClient do
  let(:account_client) { AccountClient.new 'key' }

  describe ".all" do
    it "returns all accounts" do
      account_client.all.should == []
    end
  end
end