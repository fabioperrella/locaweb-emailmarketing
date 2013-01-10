require "spec_helper"

describe Hash do
  describe ".assert_required_keys" do
    context "when invalid keys" do
      it "raises exception" do
        lambda { {aa: 1}.assert_required_keys(optional: [:bb]) }.should raise_exception ArgumentError
      end
    end

    context "when missing required keys" do
      it "raises exception" do
        lambda { {aa: 1}.assert_required_keys(optional: [:aa], required: [:bb]) }.should raise_exception ArgumentError
      end
    end

    context "when keys ok" do
      it "does not raise exception" do
        {bb: 1}.assert_required_keys(optional: [:aa], required: [:bb]).should be_nil
      end
    end
  end
end