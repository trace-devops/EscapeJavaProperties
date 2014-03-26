require 'helper'

describe ProperProperties do
  it "should have a version" do
    ProperProperties::VERSION.wont_be_nil
  end
end