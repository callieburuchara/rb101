# return an array containing colors of the fruits and sizes of veg
# sizes should be ALL CAPS and colors should be Capitalized
# return value => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, value|
  if value[:type] == "fruit"
    value[:colors].map do |color| #only had to use map here because we had to capitalize each string in it
      color.capitalize
    end
  elsif value[:type] == "vegetable"
    value[:size].upcase
  end
end

