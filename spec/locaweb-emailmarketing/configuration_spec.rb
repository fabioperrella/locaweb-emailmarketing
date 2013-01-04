require 'spec_helper'

class DummyClass
  include Configuration

  def initialize(options = {})
    validate_and_set_options options
  end
end

describe Locaweb::Emailmarketing::Configuration do
  let(:valid_options) { { auth_token: 1, base_url: 'aa' } }

  describe ".validate_and_set_options" do
    it "raises error when invalid options" do
      lambda { DummyClass.new a: 1 }.should raise_exception ArgumentError
    end

    it "set options to @options" do
      dummy = DummyClass.new valid_options
      dummy.instance_variable_get("@options").should == valid_options
    end
  end
end