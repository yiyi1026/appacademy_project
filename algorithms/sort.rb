# def bubblesort(array)
#   # O(n2)
#   sorted = false

#   until sorted
#     sorted = true

#     for i in 0...array.length-1
#       if array[i] > array[i + 1]
#         array[i], array[i + 1] = array[i + 1], array[i]
#         sorted = false
#       end

#     end
#   end
#   array

# end



# p bubblesort([3,2,1,4,5])

def selection_sort(array)
  # repeatly find the minimum element(ascending order) from unsorted part and putting it at the beginning.
  # two subarrays in an given array
  # 1. the sorted subarray
  # 2. unsorted remaining subarray

  i = 0
  for i in 0...array.length
    min_idx = i
    for j in i+1...array.length
      if array[j] < array[min_idx]
        min_idx = j
      end
    end
    array[i], array[min_idx] = array[min_idx], array[i]
  end
  array
end

p selection_sort([5,2,1,6,4])