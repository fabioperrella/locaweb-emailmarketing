require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::ListClient do
  let(:client) { Client.new auth_token: AUTH_TOKEN, base_url: BASE_URL, account_id: TRIAL_ACCOUNT_ID }

  describe ".all" do
    it "returns all lists" do
      VCR.use_cassette('list_all') do
        client.lists.create(name: "list 1", description: "lalapopo")
        client.lists.all["items"].count.should > 0
      end
    end
  end
end