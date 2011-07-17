module RPNCalculator
  SEPARATOR = /\s/
  OPERATOR  = /[+\-*\/^]/
  OPERAND   = /^(\d+.\d+|\d*)$/
  ERROR_MESSAGE = 'Invalid postfix notation'

  class Stack < Array
    def pop(count = 1)
      subset = super(count)
      if subset.size < count
        raise ERROR_MESSAGE
      else
        subset
      end
    end

    def push(element)
      if element =~ OPERAND
        super(element.to_f)
      else
        super(operate(pop(2), element))
      end
    end

    def evaluate(string)
      string.split(SEPARATOR).each do |element|
        push(element)
      end
      size == 1 && first || raise(ERROR_MESSAGE)
    end

    private

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
        else
          raise 'COMPUTERIZING ERROR, SILLY INPUT'
      end
    end
  end
end

