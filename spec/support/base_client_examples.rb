shared_examples_for "a base client" do |resource_name|
  let(:client) { Client.new auth_token: AUTH_TOKEN, base_url: BASE_URL, account_id: TRIAL_ACCOUNT_ID }

  describe ".all" do
    it "calls http GET to resource index url" do
      HttpRequestAdapter.any_instance.should_receive(:get).with("accounts/#{TRIAL_ACCOUNT_ID}/#{resource_name}")
      client.send(resource_name).all
    end

    it "returns GET response" do
      HttpRequestAdapter.any_instance.stub(:get).and_return({})
      client.send(resource_name).all.should == {}
    end
  end

  describe ".get" do
    let(:resource_id) { "lalapopolala" }

    it "calls http GET to resource show url" do
      HttpRequestAdapter.any_instance.should_receive(:get).with("accounts/#{TRIAL_ACCOUNT_ID}/#{resource_name}/#{resource_id}")
      client.send(resource_name).get(resource_id)
    end

    it "returns GET response" do
      HttpRequestAdapter.any_instance.stub(:get).and_return({})
      client.send(resource_name).get(resource_id).should == {}
    end
  end
end