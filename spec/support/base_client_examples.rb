shared_examples_for "a base client" do |resource_name|
  let(:client) { Client.new auth_token: AUTH_TOKEN, base_url: BASE_URL, account_id: TRIAL_ACCOUNT_ID }

  describe ".all" do
    it "calls http GET to #{resource_name} index url" do
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

    it "calls http GET to #{resource_name} show url" do
      HttpRequestAdapter.any_instance.should_receive(:get).with("accounts/#{TRIAL_ACCOUNT_ID}/#{resource_name}/#{resource_id}")
      client.send(resource_name).get(resource_id)
    end

    it "returns GET response" do
      HttpRequestAdapter.any_instance.stub(:get).and_return({})
      client.send(resource_name).get(resource_id).should == {}
    end
  end

  describe ".create" do
    let(:attributes) do
      attrs = {}
      requires_keys_to_create.each { |key| attrs[key] = "any_value" }
      attrs
    end

    context "when invalid attributes" do
      it "raise ArgumentError exception" do
        lambda{ client.send(resource_name).create(lalapopo: 1) }.should raise_exception ArgumentError
      end
    end

    it "calls http POST to #{resource_name} create url" do
      HttpRequestAdapter.any_instance.should_receive(:post).with("accounts/#{TRIAL_ACCOUNT_ID}/#{resource_name}", {resource_name.singularize.to_sym => attributes}).and_return(%q|{"id": "12"}|)
      client.send(resource_name).create(attributes)
    end

    it "returns created #{resource_name.singularize}'s id" do
      HttpRequestAdapter.any_instance.stub(:post).and_return(%q|{"id": "12"}|)
      client.send(resource_name).create(attributes).should == "12"
    end
  end

  describe ".update" do
    let(:resource_id) { "12334" }
    let(:attributes) do
      attrs = {}
      requires_keys_to_update.each { |key| attrs[key] = "any_value" }
      attrs
    end

    context "when invalid attributes" do
      it "raise ArgumentError exception" do
        lambda{ client.send(resource_name).update(resource_id, lalapopo: 1) }.should raise_exception ArgumentError
      end
    end

    it "calls http PUT to #{resource_name} update url" do
      HttpRequestAdapter.any_instance.should_receive(:put).with("accounts/#{TRIAL_ACCOUNT_ID}/#{resource_name}/#{resource_id}", {resource_name.singularize.to_sym => attributes})
      client.send(resource_name).update(resource_id, attributes)
    end
  end

  describe ".destroy" do
    let(:resource_id) { "lalapopolala" }

    it "calls http DELETE to #{resource_name} delete url" do
      HttpRequestAdapter.any_instance.should_receive(:delete).with("accounts/#{TRIAL_ACCOUNT_ID}/#{resource_name}/#{resource_id}")
      client.send(resource_name).destroy(resource_id)
    end
  end
end