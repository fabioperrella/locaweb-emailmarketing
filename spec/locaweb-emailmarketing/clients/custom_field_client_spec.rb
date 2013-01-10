require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::CustomFieldClient do
  let(:custom_field_client) { CustomFieldClient.new auth_token: AUTH_TOKEN, base_url: BASE_URL }

  describe ".all" do
    it "returns all accounts" do
      pending
      VCR.use_cassette('custom_field_all') do
        custom_field_client.all.should == { "items" =>
          [
            {"id"=> TRIAL_ACCOUNT_ID , "display_name"=>"trial", "plan_name"=>"Trial"}
          ],
          "page" => {"current"=>1, "total"=>1} }
      end
    end
  end
end