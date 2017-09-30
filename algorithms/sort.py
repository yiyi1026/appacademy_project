# import sys
# def selection_sort(array):
#   for i in range(len(array)):
#     min_idx = i

#     for j in range(i+1, len(array)):
#       if array[min_idx] > array[j] :
#         min_idx = j
#     array[i], array[min_idx] = array[min_idx], array[i]

#   return array

# print selection_sort([3,2,1,4,5])

def bubblesort(array):
  sorted = False

  while sorted == False:
    sorted = True

    for i in range(len(array)-1):
      if array[i] > array[i+1]:
        array[i], array[i+1] = array[i+1], array[i]
        sorted = False
  return array


print bubblesort([3,2,1,4,5])
