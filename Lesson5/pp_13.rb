# return a new array containing the same sub arrays
# but oredered logically by only taking into consideration the odd
# numbers they contain
# so want to return this: [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |sub_array|  # sort by...but by what?
  sub_array.select do |num| # by odd numbers! Select them here. 
    num.odd?
  end
end
