require 'spec_helper'
include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::AccountClient do
  let(:account_client) { AccountClient.new auth_key: 'Nt5skc1xXsvKKSsyp3Bsx7ABNdJz9pc1uA9kyTdjnJkr', base_url: 'https://emailmarketing.locaweb.com.br/api/v1' }

  describe ".all" do
    it "returns all accounts" do
      VCR.use_cassette('accounts_all') do
        account_client.all.should == []
      end
    end
  end
end