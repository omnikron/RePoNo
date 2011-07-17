require File.join(File.dirname(__FILE__), '..', 'init')

describe "Postfix evaluation" do
  it "should evaluate 3 4 + to 7" do
    '3 4 +'.evaluate_postfix.should == 7
  end

  it "should evaluate 3 5 + 5 * 2 ^ as 1600" do
    '3 5 + 5 * 2 ^'.evaluate_postfix.should == 1600
  end
end

describe "RPNCalculator::Eval#postfix?" do
  it "should return true on '3 5 + 2 *'" do
    RPNCalculator::Eval.postfix?('3 5 + 2 *').should == true
  end

  it "should return false on '3 5 + A'" do
    RPNCalculator::Eval.postfix?('3 5 + A').should == false
  end
end

