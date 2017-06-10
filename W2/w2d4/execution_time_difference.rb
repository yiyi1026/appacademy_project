# my_min
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min_phase1(list)

  list.each do |el|
    smallest = true

    list.each do |el2|
      if el > el2
        smallest = false
      end
    end

    return el if smallest
  end
end

# p my_min_phase1(list)
# What is the time complexity for this function?
# O(n^2)

def my_min_phase2(list)
  lowest_number = list.first
  list.each { |n| lowest_number = n if lowest_number > n }
  lowest_number
end

# p my_min_phase2(list)
# What is the time complexity for this function?
# O(n)



# Largest Contiguous Sub-sum
# list = [2, 3, -6, 7, -6, 7]
list = [5, 3, -7]
# list = [-5, -1, -3]

def largest_contiguous_subsum_phase1(list)
  sub_sum = []
  i = 0

  while i < list.size
    j = i

    while j < list.size
      sub_sum << list[i..j].reduce(:+)
      j += 1
    end
    i += 1
  end

  sub_sum.max
end

# p largest_contiguous_subsum_phase1(list)
# What is the time complexity for this function?
# O(n^3)

def largest_contiguous_subsum_phase2(list)
  largest = list.first
  current = list.first

  return list.max if list.all? { |n| n < 0 }

  list.drop(1).each do |el|
    current = 0 if current < 0
    current += el
    largest = current if current > largest
  end

  largest
end

p largest_contiguous_subsum_phase2(list)
# O(n) linear time
# O(1) Constant space
