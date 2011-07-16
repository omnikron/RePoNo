class String
  def reverse_polish_notation?
    !! self =~ /^\d/
  end

  def reverse_polish_notation_evaluate
    self.split(RPNCalculator::SPLIT_BY).inject([]) do |memo, element|
      operand = 
        if element =~ /^(\d+.\d+|\d*)$/
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

