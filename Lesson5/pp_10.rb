# use map to return a new array that's the same except
# the value of each integer is incremented by one

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |element|
  element.transform_values do |number|
      number + 1
  end
end


#given solution
# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
#   incremented_hash = {}
#   hsh.each do |key, value|
#     incremented_hash[key] = value + 1
#   end
#   incremented_hash
# end
