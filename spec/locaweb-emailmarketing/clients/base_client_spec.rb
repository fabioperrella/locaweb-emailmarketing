# I choosed one resource (custom_fields) to test base client completely using VCR.
# To the other inherited clients, I tested using shared example base client
require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::CustomFieldClient do
  let(:client) { Client.new auth_token: AUTH_TOKEN, base_url: BASE_URL, account_id: TRIAL_ACCOUNT_ID }

  describe ".all" do
    it "returns all custom_fields" do
      VCR.use_cassette('custom_field_all') do
        client.custom_fields.create(name: "Cidadee", type: "string")
        client.custom_fields.all["items"].find{|c| c["name"] == "Cidadee"}.should include("name"=>"Cidadee", "type"=>"string")
      end
    end

    context "when passing page param" do
      it "returns page required" do
        HttpRequestAdapter.any_instance.should_receive(:get).with(/page=2/)
        client.custom_fields.all(2)
      end
    end
  end

  describe ".get" do
    it "returns a custom_field" do
      VCR.use_cassette('custom_field_get') do
        custom_field_id = client.custom_fields.all["items"].find{|c| c["name"] == "Cidade"}["id"]
        client.custom_fields.get(custom_field_id).should include("name"=>"Cidade", "type"=>"string")
      end
    end
  end

  describe ".create" do
    it "creates a custom_field and return custom_field_id" do
      VCR.use_cassette('custom_field_create') do
        if custom_field = client.custom_fields.all["items"].find{|c| c["name"] == "codigo"}
          client.custom_fields.destroy custom_field["id"]
        end
        custom_field_id = client.custom_fields.create(name: "codigo", type: "number")
        client.custom_fields.get(custom_field_id).should include({"id"=>custom_field_id, "name"=>"codigo", "type"=>"number"})
      end
    end
  end

  describe ".update" do
    it "updates a custom_field" do
      VCR.use_cassette('custom_field_update') do
        custom_fields = client.custom_fields.all["items"]
        if custom_field = custom_fields.find{|c| c["name"] == "city"}
          client.custom_fields.destroy custom_field["id"]
        end

        custom_field = client.custom_fields.all["items"].find{|c| c["name"] == "Cidade"}
        custom_field_id = if custom_field
          custom_field["id"]
        else
          client.custom_fields.create(name: "Cidade", type: "string")
        end

        client.custom_fields.update(custom_field_id, name: "city")
        client.custom_fields.get(custom_field_id)["name"].should == "city"
      end
    end
  end

  describe ".destroy" do
    it "destroys a custom_field" do
      VCR.use_cassette('custom_field_destroy') do
        custom_field_id = client.custom_fields.create(name: "lalapopo", type: "number")
        client.custom_fields.destroy(custom_field_id)
        client.custom_fields.get(custom_field_id).should be_nil
      end
    end
  end
end