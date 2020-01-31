# ask for two numbers for input
# ask for the type of operation to perform: +, -, *, /
# perform the operation on the two numbers
# display the result of the input and the operation done

puts "Welcome to Calculator!"

puts "What's the first number?"
number1 = gets.chomp.to_i 

puts "What's the second number?"
number2 = gets.chomp.to_i 

puts "What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == "1"
  result = number1 + number2
elsif operator == "2"
  result = number1 - number2
elsif operator == "3"
  result = number1 * number2
elsif operator == "4"
  result = number1.to_f / number2.to_f
else
  puts
end

puts "The result is #{result}."
