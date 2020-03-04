SUITS = ['H', 'D', 'S', 'C']
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
DECK = VALUES.product(SUITS).shuffle

def prompt(words)
  puts "♣♦  #{words}  ♥♠"
end

def joinor(array, separator = ", ", ending = "and")
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{ending} ")
  else
    array[-1] = "#{ending} #{array.last}"
    array.join(separator)
  end
end

players_cards = []
dealers_cards = []

def initialize_cards(player, dealer)
  player << DECK.sample
  player << DECK.sample
  dealer << DECK.sample
  dealer << DECK.sample
end

def current_cards(cards)
  cards.map { |card| card[0] }
end

def display_current_cards(player, dealer)
  prompt "Dealer has: #{dealer[0][0]} and unknown card"
  prompt "You have: " + joinor(current_cards(player))
end

def hit!(cards)
  cards << DECK.sample
end

def total(cards) # fix this here
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    sum += if value.start_with?("A")
             11
           elsif value.to_i == 0
             10
           else
             value.to_i
           end
  end

  values.select { |value| value.start_with?("A") }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def busted?(cards)
  total(cards) > 21
end

# rubocop:disable Metrics/MethodLength
def player_turn(player, dealer)
  answer = nil
  loop do
    prompt "Would you like to hit or stay?"
    answer = gets.chomp
    hit!(player) if answer == "hit"
    break if answer == "stay" || busted?(player)
    display_current_cards(player, dealer)
  end

  if busted?(player)
    display_current_cards(player, dealer)
    sleep 1
    prompt "You busted!"
    sleep 1
    "busted"
  else
    prompt "You chose to stay at #{total(player)}!"
    "stay"
  end
end
# rubocop:enable Metrics/MethodLength

def dealer_turn(_player, dealer)
  loop do
    break if total(dealer) >= 17 || busted?(dealer)
    prompt "Dealer has to hit!"

    hit!(dealer)

    sleep 1
  end

  if busted?(dealer)
    prompt "The dealer busted!"
    sleep 1
    "busted"
  else
    prompt "Dealer chose to stay at #{total(dealer)}!"
    "stay"
  end
end

def calculate_winner(player, dealer)
  if busted?(player)
    "dealer"
  elsif total(player) > total(dealer)
    "player"
  elsif twenty_one?(player)
    "player"
  elsif busted?(dealer)
    "player"
  else
    "dealer"
  end
end

def twenty_one?(cards)
  total(cards) == 21
end

def display_winner(player, dealer)
  if calculate_winner(player, dealer) == "player"
    prompt "WOOHOO! YOU WON!"
    sleep 1
  elsif calculate_winner(player, dealer) == "dealer"
    prompt "Alas...you lost."
    sleep 1
  else
    prompt "It's a tie!"
  end

  display_final_cards(player, dealer)
end

def display_final_cards(player, dealer)
  prompt "The dealer had " + joinor(current_cards(dealer)) +
         " for a total of #{total(dealer)}."
  prompt "You had " + joinor(current_cards(player)) +
         " for a total of #{total(player)}."
end

def play_again?
  puts "-----------------------"
  loop do
    prompt("Do you want to play again? Type Y/Yes or N/No.")
    answer = gets.chomp.downcase
    if answer == "n" || answer == "no"
      return false
    elsif answer == "y" || answer == "yes"
      break true
    else
      prompt("Sorry, what was that? Say Y/Yes, N/No please.")
    end
  end
end

def reset_decks(player, dealer)
  player.clear
  dealer.clear
end

# BEGIN ACTUAL GAME

prompt 'Welcome to 21!'
sleep 1

loop do
  loop do
    system 'clear'

    initialize_cards(players_cards, dealers_cards)
    prompt "The dealer will now deal..."
    sleep 1
    display_current_cards(players_cards, dealers_cards)
    sleep 1

    player_turn(players_cards, dealers_cards)
    break if busted?(players_cards) || twenty_one?(players_cards)
    sleep 1

    system 'clear'

    dealer_turn(players_cards, dealers_cards)
    break if busted?(dealers_cards) || twenty_one?(dealers_cards)
    sleep 1

    break if !calculate_winner(players_cards, dealers_cards).nil?
    break if player_turn(players_cards, dealers_cards).include?("stay")
    break if dealer_turn(players_cards, dealers_cards).include?("stay")
  end

  calculate_winner(players_cards, dealers_cards)
  display_winner(players_cards, dealers_cards)
  reset_decks(players_cards, dealers_cards)

  break unless play_again?
end

prompt "Thanks for playing 21! Bye now!"
