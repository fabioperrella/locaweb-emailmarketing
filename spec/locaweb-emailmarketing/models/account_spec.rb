require 'spec_helper'
include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::Account do
  describe "#all" do
    it "returns all accounts" do
      Account.all.should == []
    end
  end
end