require 'spec_helper'
# include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::Client do
  describe ".accounts" do
    let(:client) { Client.new "apikey" }

    it "calls account method name" do
      account_client_mock = mock 'AccountClient'
      AccountClient.stub(:new).and_return account_client_mock
      client.accounts.should == account_client_mock
    end
  end
end