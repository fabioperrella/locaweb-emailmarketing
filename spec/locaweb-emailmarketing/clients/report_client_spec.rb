require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::ReportClient do
  let(:trial_account_id) { "50f8e28abf8d79f935000001" }
  let(:auth_token) { "Nt5skc1xXsvKKSsyp3Bsx7ABNdJz9pc1uA9kyTdjnJkr" }
  let(:client) { Client.new auth_token: auth_token, base_url: BASE_URL, account_id: trial_account_id }
  let(:message_id) { "50f9828436e1d9ce0d000fd5" }

  describe ".overview" do
    it "returns overview report of a message" do
      VCR.use_cassette('reports_overview') do
        data = client.reports.overview(message_id)
        expected_keys = ["status", "bounces", "clicks", "contacts", "deliveries", "openings", "uniq_openings", "unsubscribes"]
        (data.keys & expected_keys).should =~ expected_keys
      end
    end
  end

  describe ".openings" do
    it "returns openings of a message" do
      VCR.use_cassette('reports_openings') do
        data = client.reports.openings(message_id).first
        expected_keys = ["email", "ip", "access_at"]
        (data.keys & expected_keys).should =~ expected_keys
      end
    end
  end

  describe ".uniq_openings" do
    it "returns message_id of a message" do
      VCR.use_cassette('reports_uniq_openings') do
        data = client.reports.uniq_openings(message_id).first
        expected_keys = ["email", "ip", "access_at"]
        (data.keys & expected_keys).should =~ expected_keys
      end
    end
  end

  describe ".links" do
    it "returns links of a message" do
      VCR.use_cassette('reports_links') do
        data = client.reports.links(message_id).first
        expected_keys = ["href", "name"]
        (data.keys & expected_keys).should =~ expected_keys
      end
    end
  end
end