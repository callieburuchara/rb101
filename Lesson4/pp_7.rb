statement = "The Flintstones Rock"
state_arr = statement.chars
state_arr.delete(" ")

state_arr.each_with_object({}) do |element, hash|
  hash[element] = state_arr.count(element)  
end

p state_arr
# turn String into an Array with #chars
# use each_with_object to iterate over the array and create a hash
# in the method, assign the key to the element
# and assign the value to the #count of the element in the array

#GIVEN SOLUTION
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end