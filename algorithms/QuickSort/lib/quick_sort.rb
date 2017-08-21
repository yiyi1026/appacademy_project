class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    pivot = array[0]
    left = []
    right = []
    for i in (1...array.length)
      if pivot > array[i]
        left.unshift(array[i])
      else
        right.push(array[i])
      end
    end
    self.sort1(left) + [pivot] + self.sort1(right)

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new{|i, j| i <=> j}
    return array if length < 2
    pivot_idx = self.partition(array, start, length, &prc)
    l_length = pivot_idx - start
    r_length = length - l_length - 1
    self.sort2!(array, start, l_length, &prc)
    self.sort2!(array, pivot_idx + 1, r_length, &prc)
    # p array
    array

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new{|i, j| i <=> j}

    pivot_idx = start
    pivot = array[start]
    end_index = start + length - 1
    i = start + 1
    while i < end_index + 1
      if prc.call(pivot, array[i]) > 0
        array[pivot_idx + 1], array[i] = array[i], array[pivot_idx + 1]
        pivot_idx += 1

      end
      i += 1
    end
    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx
  end
end
