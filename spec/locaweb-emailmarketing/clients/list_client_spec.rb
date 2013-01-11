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

  describe ".get" do
    it "returns a list" do
      VCR.use_cassette('list_get') do
        client.lists.create(name: "list 2", description: "lalapopo")
        list_id = client.lists.all["items"].find{|c| c["name"] == "list 2"}["id"]
        client.lists.get(list_id).should include("name" => "list 2", "description" => "lalapopo")
      end
    end
  end

  describe ".create" do
    it "creates a list and return list_id" do
      pending
      VCR.use_cassette('list_create') do
        if list = client.lists.all["items"].find{|c| c["name"] == "codigo"}
          client.lists.destroy list["id"]
        end
        list_id = client.lists.create(name: "codigo", type: "number")
        client.lists.get(list_id).should include({"id"=>list_id, "name"=>"codigo", "type"=>"number"})
      end
    end
  end

  describe ".update" do
    it "updates a list" do
      pending
      VCR.use_cassette('list_update') do
        lists = client.lists.all["items"]
        if list = lists.find{|c| c["name"] == "city"}
          client.lists.destroy list["id"]
        end

        list = client.lists.all["items"].find{|c| c["name"] == "Cidade"}
        list_id = if list
          list["id"]
        else
          client.lists.create(name: "Cidade", type: "string")
        end

        client.lists.update(list_id, name: "city")
        client.lists.get(list_id)["name"].should == "city"
      end
    end
  end

  describe ".destroy" do
    it "destroys a list" do
      pending
      VCR.use_cassette('list_destroy') do
        list_id = client.lists.create(name: "lalapopo", type: "number")
        client.lists.destroy(list_id)
        client.lists.get(list_id).should be_nil
      end
    end
  end
end