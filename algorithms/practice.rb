=begin Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 ### order matters
Note:
You must do this in-place without making a copy of the array.
Minimize the total number of operations.
=end

def movezeroes(nums) # extra spacing needed
  arr = []
  for num in nums
    arr << num if num != 0
  end
  (nums.length - arr.length).times do
    arr.push(0)
  end
  arr
end

p movezeroes([0, 1, 0, 3, 12])

