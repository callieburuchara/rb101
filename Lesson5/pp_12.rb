# return a hash where the keys are the first item and value is the second item
# don't use Array#to_h

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}
arr.each do |sub_array|
  hsh[sub_array[0]] = sub_array[1]
end

p hsh