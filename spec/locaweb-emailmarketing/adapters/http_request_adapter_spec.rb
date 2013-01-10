require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::HttpRequestAdapter do
  let(:subject) { HttpRequestAdapter.new(auth_token: AUTH_TOKEN, base_url: BASE_URL) }

  describe ".initialize" do
    context "when valid options" do
      it "does not raise exception" do
        http = HttpRequestAdapter.new(auth_token: 'aa', base_url: 'http://lalapoop.com')
      end
    end

    context "when invalid options" do
      it "raises argument error exception" do
        lambda { http = HttpRequestAdapter.new(lala: 'aa') }.should raise_exception ArgumentError
      end
    end
  end

  describe ".get" do
    it "calls restclient GET with correct options" do
      RestClient.should_receive(:get).with("#{BASE_URL}/aaa", "X-Auth-Token" => AUTH_TOKEN, accept: :json).and_return "{}"
      subject.get "aaa"
    end

    it "returns JSON of http response body" do
      RestClient.stub(:get).and_return %q|{"aaaa":"123"}|
      subject.get("aaa").should == {"aaaa" => "123"}
    end
  end

  describe ".put" do
    it "calls restclient PUT with correct options" do
      attributes = {aa: 1}
      RestClient.should_receive(:put).with("#{BASE_URL}/aaa", attributes.to_json, "X-Auth-Token" => AUTH_TOKEN, content_type: :json).and_return "{}"
      subject.put "aaa", attributes
    end
  end

  describe ".post" do
    it "calls restclient POST with correct options" do
      attributes = {aa: 1}
      RestClient.should_receive(:post).with("#{BASE_URL}/aaa", attributes.to_json, "X-Auth-Token" => AUTH_TOKEN, content_type: :json).and_return "{}"
      subject.post "aaa", attributes
    end
  end
end