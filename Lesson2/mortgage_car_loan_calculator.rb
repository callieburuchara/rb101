# ask the user for loan amount
# validate this as an integer or float

# ask the user for annual percentage rate
# change apr to monthly interest rate

# ask the user for loan duration
# change loan duration to months

# print "Your monthly interest rate will be X for Y months"

def prompt(message)
  puts "*** #{message} ***"
end

def integer?(input)
  /^\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def number?(input)
  integer?(input) || float?(input)
end

loop do
  prompt("Welcome to the Loan Calculator!")

  loan_amount = nil
  loop do
    prompt("What is the total loan amount?")
    loan_amount = gets.chomp

    if loan_amount == "0"
      prompt("That's not a valid monetary amount. Please try again.")
    elsif number?(loan_amount)
      break
    else
      prompt("That's not a valid monetary amount. Please try again.")
    end
  end

  loan_amount = loan_amount.to_i

  apr = nil
  loop do
    prompt("What is the Annual Percentage Rate for this loan?
    Please write a whole number (e.g. 5 for 5%)")
    apr = gets.chomp

    if apr == "0"
      prompt("That's not a valid monetary amount. Please try again.")
    elsif number?(apr)
      break
    else
      prompt("That's not a valid monetary amount. Please try again.")
    end
  end

  year_duration = nil
  loop do
    prompt("What is the loan duration in years?")
    year_duration = gets.chomp

    if year_duration == "0"
      prompt("That's not a valid monetary amount. Please try again.")
    elsif number?(year_duration)
      break
    else
      prompt("That's not a valid monetary amount. Please try again.")
    end
  end

  month_duration = year_duration.to_i * 12

  monthly_rate = (apr.to_f / 12) / 100

  monthly_payment = loan_amount * (monthly_rate / (1 -
    (1 + monthly_rate)**(-month_duration)))

  prompt("For #{month_duration} months, you will need to pay
        $#{monthly_payment.ceil(2)} each month, at an interest
        rate of #{monthly_rate.ceil(2)}% a month.")

  prompt("Would you like to do another calculation?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thanks for using the Loan Calculator! Buh-bye!")