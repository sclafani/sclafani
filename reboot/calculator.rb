operation = 0
while operation != "exit"
  puts "Input Data: x +-*/ y.  Type exit to exit"
  operation = gets.chomp
  next if operation == "exit"
  operation = operation.split
  case operation[1]
  when "+"
    puts operation[0].to_i + operation[2].to_i
  when "-"
    puts operation[0].to_i - operation[2].to_i
  when "/"
    puts operation[0].to_i / operation[2].to_i
  when "*"
    puts operation[0].to_i * operation[2].to_i
  else
    puts "invalid input"
  end
end
