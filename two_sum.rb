def bad_two_sum?(arr, target_sum)
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target_sum
      j+=1
    end
    i+=1
  end

  false
end

#NB O(n^2)

#sorting is n log n

def okay_two_sum?(arr, target_sum)
  arr.sort!
  left_index = 0
  right_index = arr.length - 1

  until left_index == right_index
    if arr[left_index] + arr[right_index] > target_sum
      right_index -= 1
    elsif arr[left_index] + arr[right_index] < target_sum
      left_index +=1
    else
      return true
    end
  end

  false
end

#NB should be n + nlogn

# p okay_two_sum?([0, 1, 5, 7], 10)

def best_two_sum?(arr, target_sum)
  h = Hash.new
  arr.each_with_index { |el, idx| h[el] = idx }
  h.each do |number, idx|
    if h[target_sum - number] != idx
      return true unless h[target_sum - number].nil?
    end
  end
  false
end
p best_two_sum?([0, 1, 5, 7], 6)
#NB should be O(n)
