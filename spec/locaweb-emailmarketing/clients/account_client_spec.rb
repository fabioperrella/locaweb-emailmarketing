require 'spec_helper'
include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::AccountClient do
  let(:account_client) { AccountClient.new auth_token: 'Nt5skc1xXsvKKSsyp3Bsx7ABNdJz9pc1uA9kyTdjnJkr', base_url: 'https://emailmarketing.locaweb.com.br/api/v1' }

  describe ".all" do
    it "returns all accounts" do
      VCR.use_cassette('accounts_all') do
        account_client.all.should == { "items" =>
          [
            {"id"=>"50d93e8b2234cb5c69000001", "display_name"=>"trial", "plan_name"=>"Trial"}
          ],
          "page" => {"current"=>1, "total"=>1} }
      end
    end
  end
end