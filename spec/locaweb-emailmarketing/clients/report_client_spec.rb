require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::ReportClient do
  let(:client) { Client.new auth_token: AUTH_TOKEN, base_url: BASE_URL, account_id: TRIAL_ACCOUNT_ID }
  let(:message_id) { "50f97c2038a582dd0d007d41" }

  describe ".overview" do
    it "returns overview report of a message" do
      VCR.use_cassette('reports_overview') do
        data = client.reports.overview(message_id)
        expected_keys = ["status", "bounces", "clicks", "contacts", "deliveries", "openings", "uniq_openings", "unsubscribes"]
        (data.keys & expected_keys).should =~ expected_keys
      end
    end
  end
end