require 'helper'

describe EscapeJavaProperties::Parsing::Parser do
  subject { EscapeJavaProperties::Parsing::Parser }

  let(:as_hash) do
    {
      :item0 => "",
      :item1 => "item1 ",
      :item2 => "item2 ",
      :item3 => "item3",
      :"it em4" => "item4",
      :"it=em5" => "item5",
      :item6 => "item6",
      :item7 => "line 1 line 2 line 3",
      :item8 => "line 1 #Not a Comment line 2 line 3",
      :item9 => "line 1 line 2 line 3",
      :item10 => "test\n\ttestP test\n\ttest test\n\ttest = test",
      :item11 => "line 1 \\line 2 \\\\line 3 line 4",
      :item12 => "line 1\\",
      :item13 => "line 1"
    }
  end

  it "parses correctly a properties file content" do
    content    = fixture("test.properties")
    properties = subject.parse(content)

    # don't compare the hashes directly, as this hard to debug
    properties.keys.must_equal as_hash.keys
    properties.each do |key, value|
      value.must_equal as_hash[key]
    end
  end

end
