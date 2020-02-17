# using each method, output all of the vowels from the strings
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, strings|
  strings.each do |words|
    separated = words.chars
    separated.each do |letters|
      puts letters if letters.match?(/[aeiou]/)
  end
end
end