def anagram?(first_word, second_word)
  p first_word.split('').permutation.to_a.map { |letter_array| letter_array.join('') }
end

anagram?("hello", "yo")

#
# def anagrams(word)
#   return word if word.length == 1
#
#
#     last_letter = anagrams(word -1)
#
# end
