DECK = ["Ace", "Hearts"], ["Ace", "Diamonds"],
          ["Ace", "Clubs"], ["Ace", "Spades"],
          ["2", "Hearts"], ["2", "Diamonds"], ["2", "Clubs"],
          ["2", "Spades"], ["3", "Hearts"], ["3", "Diamonds"],
          ["3", "Clubs"], ["3", "Spades"], ["4", "Hearts"],
          ["4", "Diamonds"], ["4", "Clubs"], ["4", "Spades"],
          ["5", "Hearts"], ["5", "Diamonds"], ["5", "Clubs"],
          ["5", "Spades"], ["6", "Hearts"], ["6", "Diamonds"],
          ["6", "Clubs"], ["6", "Spades"], ["7", "Hearts"],
          ["7", "Diamonds"], ["7", "Clubs"], ["7", "Spades"],
          ["8", "Hearts"], ["8", "Diamonds"], ["8", "Clubs"],
          ["8", "Spades"], ["9", "Hearts"], ["9", "Diamonds"],
          ["9", "Clubs"], ["9", "Spades"], ["10", "Hearts"],
          ["10", "Diamonds"], ["10", "Clubs"],
          ["10", "Spades"], ["Jack", "Hearts"],
          ["Jack", "Diamonds"], ["Jack", "Clubs"],
          ["Jack", "Spades"], ["Queen", "Hearts"],
          ["Queen", "Diamonds"], ["Queen", "Clubs"],
          ["Queen", "Spades"], ["King", "Hearts"],
          ["King", "Diamonds"], ["King", "Clubs"],
          ["King", "Spades"]

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

def initialize_deck(player, dealer)
  player << DECK.sample
  player << DECK.sample
  dealer << DECK.sample
  dealer << DECK.sample
  # did it this way, lest it's an overly nested array 
  # if I use sample(2)
end

def player_current_cards(cards)
  cards.map {|card| card[0]}
end

def display_current_cards(player, dealer)
  prompt "Dealer has: #{dealer[0][0]} and unknown card"
  prompt "You have: " + joinor(player_current_cards(player))
end

def hit!(cards)
  cards << DECK.sample
end

def total(cards) 
  values = cards.map {|card| card[0]}

  sum = 0
  values.each do |value|
    if value.start_with?("A")
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
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
    prompt "You chose to stay!"
    "stay"
  end
end

def dealer_turn(player, dealer)
  answer = nil
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
    prompt "Dealer chose to stay!"
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
    prompt "Display_winner isn't working :("
  end

  prompt "The dealer had #{total(dealer)} and " +
           "you had #{total(player)}."
end

def play_again?
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

    initialize_deck(players_cards, dealers_cards)
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

    break if (calculate_winner(players_cards, dealers_cards) != nil)
    break if player_turn(players_cards, dealers_cards).include?("stay")
    break if dealer_turn(players_cards, dealers_cards).include?("stay")
  end
  
  calculate_winner(players_cards, dealers_cards)
  display_winner(players_cards, dealers_cards)
  reset_decks(players_cards, dealers_cards)

  break unless play_again?
end

prompt "Thanks for playing 21! Bye now!"



