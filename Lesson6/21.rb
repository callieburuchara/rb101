DECK = [{["Ace", "Hearts"] => [1, 11], ["Ace", "Diamonds"] => [1, 11],
        ["Ace", "Clubs"] => [1, 11], ["Ace", "Spades"] => [1, 11],
        ["2", "Hearts"] => 2, ["2", "Diamonds"] => 2, ["2", "Clubs"] => 2,
        ["2", "Spades"] => 2, ["3", "Hearts"] => 3, ["3", "Diamonds"] => 3,
        ["3", "Clubs"] => 3, ["3", "Spades"] => 3, ["4", "Hearts"] => 4,
        ["4", "Diamonds"] => 4, ["4", "Clubs"] => 4, ["4", "Spades"] => 4,
        ["5", "Hearts"] => 5, ["5", "Diamonds"] => 5, ["5", "Clubs"] => 5,
        ["5", "Spades"] => 5, ["6", "Hearts"] => 6, ["6", "Diamonds"] => 6,
        ["6", "Clubs"] => 6, ["6", "Spades"] => 6, ["7", "Hearts"] => 7,
        ["7", "Diamonds"] => 7, ["7", "Clubs"] => 7, ["7", "Spades"] => 7,
        ["8", "Hearts"] => 8, ["8", "Diamonds"] => 8, ["8", "Clubs"] => 8,
        ["8", "Spades"] => 8, ["9", "Hearts"] => 9, ["9", "Diamonds"] => 9,
        ["9", "Clubs"] => 9, ["9", "Spades"] => 9, ["10", "Hearts"] => 10,
        ["10", "Diamonds"] => 10, ["10", "Clubs"] => 10, 
        ["10", "Spades"] => 10, ["Jack", "Hearts"] => 10, 
        ["Jack", "Diamonds"] => 10, ["Jack", "Clubs"] => 10,
        ["Jack", "Spades"] => 10, ["Queen", "Hearts"] => 10, 
        ["Queen", "Diamonds"] => 10,["Queen", "Clubs"] => 10, 
        ["Queen", "Spades"] => 10, ["King", "Hearts"] => 10,
        ["King", "Diamonds"] => 10, ["King", "Clubs"] => 10, 
        ["King", "Spades"] => 10 }]
      



def total(cards) #verified works

  values = cards[0].values

  sum = 0
  values.each do |value|
    if value == [1, 11]
      sum =+ 11
    elsif value == 10
      sum += 10
    else
      sum += value
    end
  end

  values.select { |value| value == [1, 11]}.count.times do
    sum -= 11 if sum > 21
  end
  sum
end 

puts total(players_cards)
dealers_cards = [{}]
