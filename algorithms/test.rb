# def my_flatten(arr)
#   flattened = []
#   arr.each do |el|
#     if el.is_a?(Array)
#       flattened.concat(my_flatten(el))
#     else
#       flattened.push(el)
#     end
#   end

#   flattened
# end

# p my_flatten([1, 2, 3, [4, [5, 6]], [[[7]], 8]])

# def longest_common_prefix(strs) # leetcode 14
#   # return '' if strs.empty?
#   len_array = strs.map(&:length)
#   limit = len_array.length
#   return '' if limit == 0
#   prefix = strs[0].slice(0, limit)
#   strs.each do |el|
#       unless el.index(prefix) && el.index(prefix) == 0
#         new_len = prefix.length -1
#         return '' if new_len == 0
#         prefix = prefix.slice(0, new_len)
#       end
#   end
#   prefix
# end

# p longest_common_prefix(['a', 'b'])


# class Rectangle

#   def initialize(width, height)
#     @width = width
#     @height = height

#   end

#   def getArea
#     @width * @height
#   end
# end

# rec = Rectangle.new(3,4)

# p rec.getArea

#35. given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
#You may assume no duplicates in the array.
# def search_insert(nums, target)
#   for i in 0...nums.length
#     if nums[i] >= target
#       return i
#     end
#   end

#   nums.length
# end

# p search_insert([1,3,5,6], 7)

'''88. merge sorted array
Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

Note:
You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2. The number of elements initialized in nums1 and nums2 are m and n respectively.'''

def merge(nums1, m, nums2, n)
  i = 0
  j = 0
  while i + j < nums1.length + nums2.length && j < nums2.length
    case nums1[i] <=> nums2[j]
    when 1
      nums1.insert(i, nums2[j])
      j += 1
    when 0
      nums1.insert(i, nums2[j])
      j += 1
    end
    i += 1
  end

  nums1
end

# p merge([0], 0, [1],1)
# s = [
#     [4,8,2],
#     [4,5,7],
#     [6,1,6]

# ]
# hash = {}
# calc = []
# input = s.flatten
# 9.times do |n|
#     hash[n+1] = 1
# end
# input.each do |num|
#     case hash[num]
#     when 1
#         hash[num] = 0
#         next
#     when 0
#         calc << num
#         next
#     end
# end
# a = calc.sort!
# p a
# b = hash.keys.select{|k|hash[k] > 0}.sort
# p b
# cnt = 0
# a.each_with_index do |el1, idx1|
#     cnt += (el1-b[idx1]).abs
# end
# p cnt

# s = 'yyyyy'
# t = 'yyyyyyy'
# k = 4
# s_len = s.length
# t_len = t.length
# if s_len + t_len <= k
#     puts 'Yes'
# else
#     start = -1
#     s.each_char.with_index do |chr, idx|
#         if chr != t[idx]
#             start = idx
#             break
#         end
#     end
#     if start < 0
#         if (k - (t_len - s_len).abs) % 2 == 0
#             puts 'Yes'
#         else
#             puts 'No'
#         end
#     else
#         n = (t_len - start) + s_len - start
#         if n == k
#             puts 'Yes'
#         elsif n > k
#             puts "No"
#         elsif (k-n) % 2 == 0
#             puts 'Yes'
#         else
#             puts 'No'
#         end
#     end
# end