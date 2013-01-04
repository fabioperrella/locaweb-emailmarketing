require 'spec_helper'
include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::AccountClient do
  let(:account_client) { AccountClient.new auth_token: AUTH_TOKEN, base_url: 'https://emailmarketing.locaweb.com.br/api/v1' }
  let(:trial_account_id) { "50e66d8abf8d791719000001" }

  describe ".all" do
    it "returns all accounts" do
      VCR.use_cassette('accounts_all') do
        account_client.all.should == { "items" =>
          [
            {"id"=> trial_account_id , "display_name"=>"trial", "plan_name"=>"Trial"}
          ],
          "page" => {"current"=>1, "total"=>1} }
      end
    end
  end

  describe ".get" do
    it "returns the given account" do
      VCR.use_cassette('accounts_get') do
        account_client.get('50e66d8abf8d791719000001').should include({
          "id"=> trial_account_id , "display_name"=>"trial", "plan_name"=>"Trial"
        })
      end
    end
  end
end