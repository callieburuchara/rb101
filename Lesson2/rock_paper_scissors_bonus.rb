VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]

ABBREVIATIONS = {
  "r" => "rock",
  "p" => "paper",
  "sc" => "scissors",
  "l" => "lizard",
  "sp" => "spock"
}

WINNER_ROUND_AMOUNT = 5

def prompt(words)
  puts "*** #{words} ***"
end

def clear_screen
  system('clear') || system('cls')
end

rpsls_game_logic = {
  "rock" => ["scissors", "lizard"],
  "paper" => ["spock", "rock"],
  "scissors" => ["paper", "lizard"],
  "lizard" => ["spock", "paper"],
  "spock" => ["rock", "scissors"]
}

def display_who_win?(game_logic, user, computer)
  if game_logic[user].include?(computer)
    prompt("You won!")
  elsif game_logic[computer].include?(user)
    prompt("Computer won!")
  else
    prompt("It's a tie! No score for either.")
  end
end

overall_scores = { player: 0, computer: 0 }

def update_scores(game_logic, user, computer, score_hash)
  if game_logic[user].include?(computer)
    score_hash[:player] += 1
  elsif game_logic[computer].include?(user)
    score_hash[:computer] += 1
  end
end

def display_win_counter(user_score, computer_score)
  prompt("Your score is #{user_score} & the Computer's " \
    "score is #{computer_score}.")
  puts "-----------------------------------------------------"
end

def determine_grand_winner(score_hash)
  if score_hash[:player] == WINNER_ROUND_AMOUNT
    prompt("That's a full match! And...")
    sleep 2
    prompt("You are the ultimater winner!")
    sleep 2
    score_hash[:player] = 0
    score_hash[:computer] = 0
  elsif score_hash[:computer] == WINNER_ROUND_AMOUNT
    prompt("That's a full match! And...")
    sleep 2
    prompt("You are..! The ultimate loser. Alas.")
    sleep 2
    score_hash[:player] = 0
    score_hash[:computer] = 0
  end
end

# PROGRAM START
loop do
  clear_screen

  user_choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = gets.chomp.downcase

    if VALID_CHOICES.include?(user_choice)
      break
    elsif ABBREVIATIONS.key?(user_choice)
      user_choice = ABBREVIATIONS[user_choice]
      break
    else
      prompt("That's not a valid choice. Please type the name,
        the first letter, or 'sc' for scissors or 'sp' for spock.")
    end
    user_choice
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{user_choice}; Computer chose #{computer_choice}.")

  display_who_win?(rpsls_game_logic, user_choice, computer_choice)

  update_scores(rpsls_game_logic, user_choice, computer_choice, overall_scores)

  display_win_counter(overall_scores[:player], overall_scores[:computer])

  determine_grand_winner(overall_scores)

  loop do
    prompt("Do you want to play again?")
    answer = gets.chomp.downcase
    if answer == "n" || answer == "no"
      prompt("Thank you for playing! Buh-bye!")
      return
    elsif answer == "y" || answer == "yes"
      break
    else
      prompt("Sorry, what was that? Say Y/Yes, N/No please.")
    end
  end
end
