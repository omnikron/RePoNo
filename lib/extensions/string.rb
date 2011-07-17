class String
  def evaluate_postfix
    RPNCalculator::Eval[self]
  end

#  def to_postfix
#  end

#  def to_infix
#  end
end
