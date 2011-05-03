require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Numeric#humanize" do
  it "humanizes" do
    (10 ** 7).humanize.should == "10 million"
    (10 ** 8).humanize.should == "100 million"
    (10 ** 9).humanize.should == "1 billion"
    (10 ** -9).humanize.should == "1 billionths"
    (10 ** -8).humanize.should == "10 billionths"
    9769160976976976.humanize.should == "9.77 * 10^15"
    9769160976976976.humanize(2).should == "9.8 * 10^15"
    9769160976976976.humanize(4).should == "9.769 * 10^15"
    976916097697697600.humanize.should == "977 * 10^15"
    97691609769.humanize.should == "97.7 billion"
    9769160976.humanize.should == "9.77 billion"
  end
end
