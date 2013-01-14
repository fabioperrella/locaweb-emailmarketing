require "spec_helper"

include Locaweb::Emailmarketing

describe Locaweb::Emailmarketing::ListClient do
  it_should_behave_like "a base client", "lists"
end