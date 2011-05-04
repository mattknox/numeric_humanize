require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Numeric#humanize" do
  it "humanizes" do
    (10 ** 7).humanize.should == "10 million"
    (10 ** 8).humanize.should == "100 million"
    (10 ** 9).humanize.should == "1 billion"
    (10 ** -9).humanize.should == "1 billionths"
    (10 ** -8).humanize.should == "10 billionths"
    (10 ** -7).humanize.should == "100 billionths"
    9769160976976976.humanize.should == "9.77 * 10^15"
    9769160976976976.humanize(2).should == "9.8 * 10^15"
    9769160976976976.humanize(4).should == "9.769 * 10^15"
    976916097697697600.humanize.should == "977 * 10^15"
    97691609769.humanize.should == "97.7 billion"
    9769160976.humanize.should == "9.77 billion"
  end

  it "to_sci" do
    (10 ** 7).to_sci.should == "1E+07"
    (10 ** 8).to_sci.should == "1E+08"
    (10 ** 11).to_sci.should == "1E+11"
    (10 ** 15).to_sci.should == "1E+15"
    (10 ** -7).to_sci.should == "1E-07"
    9876543210.to_sci.should == "9.88E+09"
    9876543210.to_sci(4).should == "9.877E+09"
  end
end
