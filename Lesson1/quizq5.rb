def method(string)
  array = string.split(" ")
  integers = array.map {|word| word.length}
  p integers
end

  method("to be or not to be")

# define a method with one argument that's a string
# split the words into an array
# iterate over each word and take the length of the words
# turn those numbers into a new array
# return an array of integers
# end