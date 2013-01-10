require 'spec_helper'

class DummyClass
  include Locaweb::Emailmarketing::ClientValidations

  def initialize(options = {})
    validate_and_set_options options
  end
end

describe Locaweb::Emailmarketing::ClientValidations do
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

  describe ".validate_attributes" do
    let(:dummy) { DummyClass.new valid_options }

    context "options attributes" do
      it "returns true when doesnt have optional attributes" do
        dummy.validate_attributes({}, { optional: [:aa] }).should be_true
      end

      it "returns true when have optional attributes" do
        dummy.validate_attributes({aa: 1}, { optional: [:aa] }).should be_true
      end
    end

    context "invalid attributes" do
      context "when unknown option" do
        it "raises ArgumentError exception" do
          lambda { dummy.validate_attributes({lalapopo: 1}, { optional: [:aa] })}.should raise_exception ArgumentError
        end

        it "list unknown attributes" do
          begin
            dummy.validate_attributes({lalapopo: 1}, { optional: [:aa] })
          rescue ArgumentError => e
            e.message.should == "unkown attributes: lalapopo"
          end
        end
      end
    end
  end
end