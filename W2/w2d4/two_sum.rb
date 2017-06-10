def bad_two_sum?(arr, target)
  arr.each_with_index do |el, i|
    arr.each_with_index do |el2, j|
      next if i <= j
        return true if (el + el2) == target
    end
  end

  false
end

arr = [0, 1, 5, 7] # 0 1 5 7

# p bad_two_sum?(arr, 6)
# p bad_two_sum?(arr, 9)
# bad_two_sum? time complexity
# O(n^2)

def okay_two_sum?(arr, target)
  arr = arr.sort
  i = 0
  j = arr.length - 1

  while i < j

    case (arr[i] + arr[j]) <=> target
    when 0
      return true
    when -1
      i += 1
    when 1
      j -= 1
    end
  end

  false
end

p okay_two_sum?(arr, 9)
p okay_two_sum?(arr, 6)

# okay_two_sum? is considered O(nlogn) because of the arr.sort.
# anything below is dominated by the .sort above

def two_sum?(arr, target)
  count = {}

  arr.each do |el|
    count[el] = true
  end

  arr.each do |num|
    return true if count[target - num]
  end

  false
end

p two_sum?(arr, 9)
p two_sum?(arr, 6)
