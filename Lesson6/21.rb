DECK = [{ "Ace" => [1, 11], "2" => 2, "3" => 3, "4" => 4,
        "5" => 5 , "6" => 6, "7" => 7, "8" => 8, "9" => 9,
        "10" => 10, "Jack" => 10, "Queen" => 10, "King" => 10 }]
#Choosing above because I don't see the point of needing to know
#what suit a card is when it's never used?


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

players_cards = [{}]

dealers_cards = [{}]
