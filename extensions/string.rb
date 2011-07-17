class String
  def postfix?
    # TO DO: this expression needs to be corrected
    !! self =~ /^(\d+.\d+|\d*)\s(\d+.\d+|\d*)\s((\d+.\d+|\d*)\s|[+\-*\/^]\s)*$/
  end

  def evaluate_postfix
    self.split(RPNCalculator::SEPARATOR).inject([]) do |memo, element|
      operand = 
        if element =~ RPNCalculator::OPERAND
          element.to_f
        else
          RPNCalculator::Operations.operate(memo.pop(2), element)
        end
      memo.push(operand)
    end.first
  end

  def to_postfix
  end

  def to_infix
  end
end

