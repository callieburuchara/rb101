# ask for two numbers for input
# ask for the type of operation to perform: +, -, *, /
# perform the operation on the two numbers
# display the result of the input and the operation done

# REFACTORING
# add a hashrocket to the beginning of every prompt through a method
# turn if statement into case statement
# have validation loops for every input (separate loops)
# because of loops, define variables outside of them so they can be accessed
# build an overarching loop that asks user if they want to do another go
# add a name retrieval component and use user name in responses
# add a heredoc to operator selection for clarity
# add a choice confirmation for the user to see

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ""
loop do
  name = gets.chomp

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ""
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")
    end
  end

  number2 = ""
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ""
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when "1"
              number1.to_i + number2.to_i
            when "2"
              number1.to_i + number2.to_i
            when "3"
              number1.to_i * number2.to_i
            when "4"
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}.")

  prompt("Do you want to perform another calculation, #{name}?
  (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for using the calculator. Good bye, #{name}!")
