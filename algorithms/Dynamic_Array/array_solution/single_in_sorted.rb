#given a sorted array consisting of only integers , all of them #appear twice except one. find the single element that appears only #once
# [1,1,3,3,5,5,7,8,8] length of 9 mid_idx of 4, mid_el = 5
# [1,1,3,5,5,7,7,8,8] length of 9 mid_idx of 4, mid_el = 5

# [1,1,3,3,5,7,7] length of 7 mid_idx of 3, mid_el = 3
# [1,1,3,5,5,7,7] length of 7 mid_idx of 3, mid_el = 5
def single_in_sorted(arr)
  return arr[0] if arr.length == 1
  mid_idx = arr.length/2
  return arr[mid_idx] if arr[mid_idx-1] != arr[mid_idx] && arr[mid_idx] != arr[mid_idx+1]
  if mid_idx.even? && arr[mid_idx] == arr[mid_idx + 1]
    return single_in_sorted(arr[mid_idx + 2..-1])
  elsif mid_idx.even?
    return single_in_sorted(arr[0..mid_idx-2])
  elsif arr[mid_idx] == arr[mid_idx-1]
    return single_in_sorted(arr[mid_idx+1..-1])
  else
    return single_in_sorted(arr[0..mid_idx-1])
  end
end
arr0 = [1,1,3,8,8]
arr1 = [1,1,3,3,5,5,7,8,8] #length of 9 mid_idx of 4, mid_el = 5
arr2 =  [1,1,3,5,5,7,7,8,8] #length of 9 mid_idx of 4, mid_el = 5

arr3 =  [1,1,3,3,5,7,7] #length of 7 mid_idx of 3, mid_el = 3
arr4 = [1,1,3,5,5,7,7] #length of 7 mid_idx of 3, mid_el = 5
arr5 = [7,8,8]
# p single_in_sorted(arr0) # 3
# p single_in_sorted(arr1) # 7
# p single_in_sorted(arr2) # 3
# p single_in_sorted(arr3) # 5
# p single_in_sorted(arr4) # 3
# p single_in_sorted(arr5) # 7
# p arr5[0..0]