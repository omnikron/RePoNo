module RPNCalculator
  SEPARATOR     = /\s/
  OPERATOR      = /[+\-*\/^]/
  OPERAND       = /^[+-]?(\d+.\d+|\d+)+$/
  ERROR_MESSAGE = 'Invalid postfix notation'

  class Eval < Array
    class << self
      def [](string)
        stack = string.split(SEPARATOR).inject(new) do |memo, element|
          memo.push(element)
        end
        stack.size == 1 && stack.first || raise(ERROR_MESSAGE)
      end
    end

    def push(element)
      if element =~ OPERAND
        super(element.to_f)
      else
        super(operate(pop(2), element))
      end
    end

    private

    def pop(count = 1)
      subset = super(count)
      if subset.size < count
        raise ERROR_MESSAGE
      else
        subset
      end
    end

    def operate(operands, operator)
      case operator
        when '+'
          operands.first + operands.last
        when '-'
          operands.first - operands.last
        when '/'
          operands.first / operands.last
        when '*'
          operands.first * operands.last
        when '^'
          operands.first ** operands.last
        else
          raise 'COMPUTERIZING ERROR, SILLY INPUT'
      end
    end
  end
end
