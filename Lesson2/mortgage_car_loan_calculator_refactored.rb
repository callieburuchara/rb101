# METHOD DEFINITIONS FOR PROGRAM
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

def clear_screen
  system('clear') || system('cls')
end

def loan_amount_input_request
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
  loan_amount
end

def apr_input_request
  apr = nil
  loop do
    prompt("What is the Annual Percentage Rate for this loan?
    Please write a whole number (e.g. 5 for 5%)")
    apr = gets.chomp

    if apr == "0"
      prompt("That's not a valid interest rate. Please try again.")
    elsif number?(apr)
      break
    else
      prompt("That's not a valid interest rate. Please try again.")
    end
  end
  apr
end

def year_duration_input_request
  year_duration = nil
  loop do
    prompt("What is the loan duration in years?")
    year_duration = gets.chomp

    if year_duration == "0"
      prompt("That's not a valid year duration. Please try again.")
    elsif integer?(year_duration)
      break
    else
      prompt("That's not a valid year duration. Please try again.")
    end
  end
  year_duration
end

def calculate_monthly_payment(loan, mrate, mduration)
  loan * (mrate / (1 -
    (1 + mrate)**(-mduration)))
end

# START OF PROGRAM
loop do
  clear_screen

  prompt("Welcome to the Loan Calculator!")

  loan_amount = loan_amount_input_request.to_f

  apr = apr_input_request.to_f

  year_duration = year_duration_input_request.to_i

  month_duration = year_duration.to_i * 12

  monthly_rate = (apr.to_f / 12) / 100

  monthly_payment = calculate_monthly_payment(loan_amount, monthly_rate,
                                              month_duration)

  prompt("For #{month_duration} months, you will need to pay
        $#{monthly_payment.ceil(2)} each month, at an interest
        rate of #{monthly_rate.ceil(2)}% a month.")

  answer = nil
  loop do
    prompt("Would you like to do another calculation? (yes or no)")
    answer = gets.chomp
    if answer != "no" && answer != "yes"
      prompt("Please enter yes or no.")
    else
      break
    end
  end
  break unless answer == "yes"
end

prompt("Thanks for using the Loan Calculator! Buh-bye!")
