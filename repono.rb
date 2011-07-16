#RePoNo, Reverse Polish Notation calculator

puts "RePoNo 0.1"
puts ""
puts "Please enter a RPN calculation"
puts "for example, 23 5 3 * - (returns '8')"
 
input = gets.chomp
stack = []

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
    else puts 'COMPUTERIZING ERROR, SILLY INPUT'
  end
end

input.split.each do |element|
  if element =~ /^\d*$/
    stack.push(element.to_f)
  else
    operation_result = operate(stack.pop(2), element)
    stack.push(operation_result)
  end
end

result = stack.pop
if result == result.to_i
  puts result.to_i
else
  puts result
end
