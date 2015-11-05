def my_min(array)
  array.each do |num1|
    return num1 if num1 if array.none? do |num2|
      num1 > num2
    end
  end
end

#NB n^2 WORST CASE

def my_min_iterative(array)
  minimum = nil

  array.each { |element| minimum = element if  minimum.nil? || element < minimum }

  minimum
end

#NB n WORST CASE

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#
# p my_min_iterative(list)


def largest_sub_sum(array)
  subsets = []
  i = 0
  while i < array.length
    j = i
    while j < array.length
      subsets << array[i..j]
      j += 1
    end
    i += 1
  end
  result = nil
  subsets.map {|subset| subset.inject(:+)}.each do |sum|
    result = sum if result.nil? || result < sum
  end
  result
end

list = [5, 3, -7]
p largest_sub_sum(list)

#NB n^6 worst case

def better_largest_sub_sum(array)
  largest_sum = 0
  array.each_with_index do |el, idx|
    largest_sum += el if el > 0
  end

  largest_sum
end

p better_largest_sub_sum(list)
