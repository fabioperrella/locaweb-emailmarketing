require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::ContactImportClient do
  let(:client) { Client.new auth_token: AUTH_TOKEN, base_url: BASE_URL, account_id: TRIAL_ACCOUNT_ID }

  describe ".all" do
    it "returns all contact_imports" do
      VCR.use_cassette('contact_import_all') do
        #TODO: create a list to use in list_tokens
        client.contact_imports.create(name: "importacao 1", description: "lalapopo", list_tokens: '50f0083236e1d9254b01a2e9', url: 'https://gist.github.com/raw/4513418/d0ddb3cee0295f7bf6fec6e7817751b1a23b9a4d/gistfile1.txt')
        client.contact_imports.all["items"].count.should > 0
      end
    end
  end
end