require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::ListClient do
  let(:client) { Client.new auth_token: AUTH_TOKEN, base_url: BASE_URL, account_id: TRIAL_ACCOUNT_ID }

  describe "methods from base client" do
    [:all, :get, :create, :update, :destroy].each do |method|
      it "responds to #{method}" do
        client.lists.should respond_to method.to_sym
      end
    end
  end
end