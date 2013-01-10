require 'spec_helper'
include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::AccountClient do
  let(:client) { Client.new auth_token: AUTH_TOKEN, base_url: BASE_URL, account_id: TRIAL_ACCOUNT_ID }

  describe ".all" do
    it "returns all accounts" do
      VCR.use_cassette('accounts_all') do
        client.accounts.all.should == { "items" =>
          [
            {"id"=> TRIAL_ACCOUNT_ID , "display_name"=>"trial", "plan_name"=>"Trial"}
          ],
          "page" => {"current"=>1, "total"=>1} }
      end
    end
  end

  describe ".get" do
    it "returns the given account" do
      VCR.use_cassette('accounts_get') do
        client.accounts.get(TRIAL_ACCOUNT_ID).should include({
          "id"=> TRIAL_ACCOUNT_ID , "display_name"=>"trial", "plan_name"=>"Trial"
        })
      end
    end
  end

  describe ".update" do
    it "updates given account" do
      VCR.use_cassette('accounts_update') do
        client.accounts.update(TRIAL_ACCOUNT_ID, return_path_domain: 'trial3.newssender.com.br')
        client.accounts.get(TRIAL_ACCOUNT_ID).should include({"return_path_domain" => 'trial3.newssender.com.br'})
      end
    end
  end
end