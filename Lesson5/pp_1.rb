# sort array by descending numeric value

arr = ['10', '11', '9', '7', '8']

arr.sort_by {|num| num.to_i}.reverse

#given solution

arr.sort do |a,b|
  b.to_i <=> a.to_i
end 