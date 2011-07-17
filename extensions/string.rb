class String
  def postfix?
    # TO DO: this expression needs to be corrected
    !! self =~ /^(\d+.\d+|\d*)\s(\d+.\d+|\d*)\s((\d+.\d+|\d*)\s|[+\-*\/^]\s)*$/
  end

  def evaluate_postfix
    RPNCalculator::Stack.new.evaluate(self)
  end

  def to_postfix
  end

  def to_infix
  end
end

