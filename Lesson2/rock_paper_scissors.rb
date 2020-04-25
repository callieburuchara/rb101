VALID_CHOICES = ["rock", "paper", "scissors"]

def prompt(words)
  puts "*** #{words} ***"
end

def clear_screen
  system('clear') || system('cls')
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
  (first == "paper" && second == "rock") ||
  (first == "scissors") && second == "paper"
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

# PROGRAM START
loop do
  clear_screen
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose #{choice}; Computer chose #{computer_choice}."

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for playing! Buh-bye!")
