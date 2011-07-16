module RPNCalculator
  SPLIT_BY  = ' '
  OPERATORS = %w(+ - * / ^ !)

  class Operations
    def self.operate(operands, operator)
      case operator
        when '+'
          operands.first + operands.last
        when '-'
          operands.first - operands.last
        when '/'
          operands.first / operands.last
        when '*'
          operands.first * operands.last
        else
          raise 'COMPUTERIZING ERROR, SILLY INPUT'
      end
    end
  end
end

