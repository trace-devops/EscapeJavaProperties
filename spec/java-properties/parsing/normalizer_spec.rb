require 'helper'

describe ProperProperties::Parsing::Normalizer do
  subject { ProperProperties::Parsing::Normalizer }

  it "normalizes by applying all rules" do
    content    = fixture("test.properties")
    normalized = fixture("test_normalized.properties")
    subject.normalize! content
    content.must_equal normalized
  end

end