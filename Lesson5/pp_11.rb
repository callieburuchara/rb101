# use select or reject to return a new array identical in structure
# but containing only the integers that are multiples of 3

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_array|
  sub_array.select do |number|
    number % 3 == 0
  end
end