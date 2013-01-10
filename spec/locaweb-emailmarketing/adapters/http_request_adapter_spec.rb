require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::HttpRequestAdapter do
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
    it "does something" do
      pending
    end
  end

  describe ".put" do
    it "does something" do
      pending
    end
  end
end