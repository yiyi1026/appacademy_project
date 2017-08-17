require_relative 'heap'

def k_largest_elements(array, k)
  count = array.length
  2.upto(count).each do |size|
    BinaryMinHeap.heapify_up(array, size - 1, size)
  end

  count.downto(2).each do |size|
    array[0], array[size - 1] = array[size - 1], array[0]
    BinaryMinHeap.heapify_down(array, 0, size - 1)
  end

  array[0...k]
end
