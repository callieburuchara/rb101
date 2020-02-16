def titleize(string)
  string.split.map! do |word|
    word.capitalize
  end 
  array.join(" ")
end

puts titleize("the flintstones rock")

# GIVEN SOLUTION
def titleize(words)
  words.split.map { |word| word.capitalize}.join(" ")
end 