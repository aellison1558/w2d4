def anagram?(first_word, second_word)
  first_word.split('').permutation.to_a.uniq.map do |letter_array|
    letter_array.join('')
  end.include?(second_word)
end
# p anagram?("helloabcde", "helloabcde")

# p [1,2,4,6,7,4,5,6,644, 10].permutation.to_a.count
#Time Complexity is at least n!, probably worse (n * n! * n! * n! * n!)

# Andrew's practice writing permutation
# class String
#   def permutation
#     return [self] if self.length < 2
#     permutations = []
#     self.each_char do |letter|
#       remainder = self.sub(letter, "").permutation
#       remainder.each do |permutation|
#         permutations << letter + permutation
#       end
#     end
#     permutations
#   end
# end
# p "hello".permutation

# Patrick's practice writing permutation
# def permutation(array)
#   return array if array.length <= 1
#
#   permutations = []
#
#   array.each do |element|
#     array.delete(element)
#     permutation(array)).each do |perm|
#
#
#       permutations << [element] + perm
#     end
#
#
#   end
#
#   permutations
# end

def anagram?(first_word, second_word)
  until first_word.length == 0
    comparing_letter = first_word[0]
    first_word.delete!(first_word[0])
    second_word.each_char do |char|
      if char == comparing_letter
        second_word.delete!(char)
        break
      end
    end
  end

  second_word.length == 0 ? true : false

end

#Time Complexity of worst case is n^2

# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true

def third_anagram?(first_word, second_word)
  first_word.chars.sort == second_word.chars.sort
end

# Time Complexity 2*n*n*logn 2n + nlogn,
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(first_word, second_word)
  first_hash = Hash.new(0)
  second_hash = Hash.new(0)
  first_word.each_char do |char|
    first_hash[char] += 1
  end
  second_word.each_char do |char|
    second_hash[char] += 1
  end
  first_hash == second_hash
end
# p fourth_anagram?("elvis", "lives")    #
# p fourth_anagram?("gizmo", "sally")    #=> false
#Time complexity: 3n

def fifth_anagram?(first_word, second_word)
  hash = Hash.new(0)
  first_word.each_char do |char|
    hash[char] += 1
  end

  second_word.each_char do |char|
    hash[char] -= 1
  end
  hash.values.all? {|value| value == 0}
end

#Time complexity: 3n, but more efficient space complexity (n vs. 2n)
p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #
