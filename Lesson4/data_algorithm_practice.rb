# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []


# input: string
# output: array of substrings
# rules:
#   -substrings don't have to be separated by spaces
#   -therefore the method has to look at characters, not words as a whole
#   -small palindromes can be listed in addition to bigger palindromes that include them
#   -return the array, don't print it
#   -if no palindromes or empty, still return an empty array
#   -return only substrings that are palindromes
#   -palindrome words should be case sensitive

# data structure to use: array, since that's the desired output