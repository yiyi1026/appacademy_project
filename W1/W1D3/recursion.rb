def exp(b, n)
  return 1 if n == 0
  if n > 0
    b * exp(b, n-1)
  else
    p b
    exp(b * 1.0,n+1) * ( 1.0/ b)
  end
end

def exp2(b,n)
  return nil if b == 0 && n == 0
  return 0 if b == 0
  return 1 if n == 0
  if n.even?
    exp2(b, n/2) * exp2(b, n/2)
  else
    b * exp2(b, (n - 1)/2) * exp2(b, (n - 1)/2)
  end
end

def deep_dup(arr)
  arr.map do |row|
    if row.is_a? Array
      deep_dup(row)
    elsif row.is_a? Integer
      row
    else
      row.dup
    end
  end
end

def fib(n)
  return [0] if n < 1
  return [0,1] if n == 1
  fib(n-1) + [fib(n-2)[-1]+fib(n-1)[-1]]
end

def subsets(arr)
  return [[]] if arr.empty?
  short_array = arr.take(arr.length - 1)
  smaller_subs = subsets(short_array)
  new_subs = smaller_subs.map do |small_sub|
    small_sub + [arr.last]
  end
  smaller_subs + new_subs
end

def permutations(arr)
  return [arr] if arr.length == 1
  short_array = arr.take(arr.length - 1)
  small_subs = permutations(short_array)
  result = []
  small_subs.map do |small_sub|
    number_of_positions = small_sub.length + 1
    number_of_positions.times do |i|
      result << small_sub[0...i] + [arr.last] + small_sub[i..-1]
    end
  end
  result

end

def bsearch(arr, target)

  return nil if arr.empty?
  middle = arr.length / 2
  if arr[middle] == target
    return middle
  elsif arr[middle] > target
    bsearch(arr[0...middle], target)
  else
    result = bsearch(arr[(middle+1)..-1], target)
    return result + middle unless result.nil?
  end
end

def merge_sort(arr)
  return arr if arr.length <2
  first_half = merge_sort(arr[0...arr.length/2])
  second_half = merge_sort(arr[arr.length/2..-1])
  p "test"
  merge_sort(first_half, second_half)
end

def merge(first_half, second_half)
  if first_half > second_half
    [second_half, first_half]
  else
    [first_half, second_half]
  end
end
