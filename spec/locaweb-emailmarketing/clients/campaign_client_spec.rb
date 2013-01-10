require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::CampaignClient do
  let(:client) { Client.new auth_token: AUTH_TOKEN, base_url: BASE_URL, account_id: TRIAL_ACCOUNT_ID }

  describe ".all" do
    it "returns all campaigns" do
      VCR.use_cassette('campaign_all') do
        client.campaigns.create(name: "camp 2")
        client.campaigns.all["items"].find{|c| c["name"] == "camp 2"}.should include("name"=>"camp 2")
      end
    end
  end

  describe ".get" do
    it "returns a campaign" do
      VCR.use_cassette('campaign_get') do
        campaign_id = client.campaigns.create(name: "camp 3")
        client.campaigns.get(campaign_id).should include("name"=>"camp 3")
      end
    end
  end

  describe ".create" do
    it "creates a campaign and return campaign_id" do
      VCR.use_cassette('campaign_create') do
        if campaigns = client.campaigns.all["items"].find{|c| c["name"] == "campanha 1"}
          client.campaigns.destroy campaigns["id"]
        end
        campaign_id = client.campaigns.create(name: "campanha 1", description: "desc camp 1")
        client.campaigns.get(campaign_id).should include({"id"=>campaign_id, "name"=>"campanha 1"})
      end
    end
  end

  describe ".update" do
    it "updates a campaign" do
      VCR.use_cassette('campaign_update') do
        campaign_id = client.campaigns.create(name: "camp 5", description: "desc camp 1")
        client.campaigns.update(campaign_id, name: "camp 55")
        client.campaigns.get(campaign_id)["name"].should == "camp 55"
      end
    end
  end

  describe ".destroy" do
    it "destroys a campaign" do
    pending
      VCR.use_cassette('campaign_destroy') do
        campaign_id = client.campaigns.create(name: "lalapopo", type: "number")
        client.campaigns.destroy(campaign_id)
        client.campaigns.get(campaign_id).should be_nil
      end
    end
  end
end