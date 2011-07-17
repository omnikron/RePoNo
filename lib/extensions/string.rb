class String
  def postfix?
    RPNCalculator::Eval.postfix?(self)
  end

  def evaluate_postfix
    RPNCalculator::Eval[self]
  end

#  def to_postfix
#  end

#  def to_infix
#  end
end

