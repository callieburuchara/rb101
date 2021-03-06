INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNER_ROUND_AMOUNT = 5
FIRST_PLAYER = "choose"

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "==> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts"     |     |"
  puts"  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts"     |     |"
  puts"-----+-----+-----"
  puts"     |     |"
  puts"  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts"     |     |"
  puts"-----+-----+-----"
  puts"     |     |"
  puts"  #{brd[7]}  |  #{brd[8]}  |   #{brd[9]}"
  puts"     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, separator = ", ", ending = "or")
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{ending} ")
  else
    array[-1] = "#{ending} #{array.last}"
    array.join(separator)
  end
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  prompt "Computer's turn..."
  sleep 1

  square = nil
  square = computer_offense(brd, square) ||
           computer_defense(brd, square) ||
           mark_five(brd, square)

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def computer_offense(brd, square)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def computer_defense(brd, square)
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end
  square
end

def mark_five(brd, _square)
  _square = 5 if brd[5] == ' '
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

overall_scores = { player: 0, computer: 0 }

def update_scores(score_hash, brd)
  if detect_winner(brd) == 'Player'
    score_hash[:player] += 1
  elsif detect_winner(brd) == 'Computer'
    score_hash[:computer] += 1
  end
end

def display_win_counter(user_score, computer_score)
  prompt("Your score is #{user_score} & the Computer's " \
    "score is #{computer_score}.")
  puts "-----------------------------------------------------"
end

def reset_scores(score_hash)
  score_hash[:player] = 0
  score_hash[:computer] = 0
end

def determine_display_grand_winner(score_hash)
  if score_hash[:player] == WINNER_ROUND_AMOUNT
    prompt("That's a full match! And...")
    sleep 2
    prompt("You are the ultimater winner!")
    sleep 2
  elsif score_hash[:computer] == WINNER_ROUND_AMOUNT
    prompt("That's a full match! And...")
    sleep 2
    prompt("You are..! The ultimate loser. Alas.")
    sleep 2
  end
end

def who_first
  if FIRST_PLAYER == 'choose'
    ask_choice_first_player
  elsif FIRST_PLAYER == 'player'
    'player'
  elsif FIRST_PLAYER == 'computer'
    'computer'
  end
end

def ask_choice_first_player
  prompt "Who would you like to go first? Type 'p' for player " \
         "(yourself) or 'c' for computer."

  loop do
    preference = gets.chomp.downcase

    if preference == 'p'
      break 'player'
    elsif preference == 'c'
      break 'computer'
    else
      prompt "Sorry, not a valid choice. Type 'p' or 'c'."
    end
  end
end

def play_again?
  loop do
    prompt("Do you want to play again? Type Y/Yes or N/No.")
    answer = gets.chomp.downcase
    if answer == "n" || answer == "no"
      return
    elsif answer == "y" || answer == "yes"
      return true
    else
      prompt("Sorry, what was that? Say Y/Yes, N/No please.")
    end
  end
end

def place_piece!(brd, current)
  if current == "player"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current)
  current == "player" ? 'computer' : 'player'
end

# ACTUAL GAME BEGINNING
loop do
  board = initialize_board

  current_player = who_first

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  update_scores(overall_scores, board)

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  display_win_counter(overall_scores[:player], overall_scores[:computer])
  determine_display_grand_winner(overall_scores)

  reset_scores(overall_scores) if overall_scores.values.include?(5)

  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe! Buh-bye!"
