numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# => 1
#    3



numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# =>  1
#     2

# For both, the array is being changed as we go (shortened & shifted)
# so as a new number is being put, so another number is being removed
# either from the front (shift) or the back (pop)
#so for shift, after 1 is deleted, 3 is now in the second spot, so that's where
# the counter of each goes to, even though it inadvertently skips "2"
# For pop, 3 and 4 are deleted before they can be printed. p is moving from l to r
# and pop is deleted from r to l, so they meet in the middle and only 1 & 2 are printed
