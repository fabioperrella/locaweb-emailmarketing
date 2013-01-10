require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::CustomFieldClient do
  let(:client) { Client.new auth_token: AUTH_TOKEN, base_url: BASE_URL, account_id: TRIAL_ACCOUNT_ID }

  describe ".all" do
    it "returns all custom_fields" do
      VCR.use_cassette('custom_field_all') do
        client.custom_fields.all["items"].find{|c| c["name"] == "Cidade"}.should include("name"=>"Cidade", "type"=>"string")
      end
    end
  end
end