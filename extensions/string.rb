class String
  def reverse_polish_notation?
    # TO DO: this expression needs to be corrected
    !! self =~ /^(\d+.\d+|\d*)\s(\d+.\d+|\d*)\s((\d+.\d+|\d*)\s|[+\-*\/^]\s)*$/
  end

  def reverse_polish_notation_evaluate
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

  def to_reverse_polish_notation
  end

  def to_infix_notation
  end
end

