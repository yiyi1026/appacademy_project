# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  dictionary = ('a'..'z').to_a
  str.chars.map do |letter|
    index = dictionary.index(letter)
    if index
      pos = index + shift
      pos %= 26
      dictionary[pos]
    else
      letter
    end
  end.join("")
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  return num if num < 10
  digital_root( num % 10)
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  if alphabet.nil?
    str.chars.sort.join("")
  else
    str.chars.sort{|x,y| alphabet.index(x) <=> alphabet.index(y)}.join("")
  end
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    result = []
    each_with_index do |el, start_idx|
      (start_idx+1...length).each do |end_idx|
        result << [start_idx, end_idx] if self[start_idx] + self[end_idx] == 0
      end
    end
    result
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    result = []
    split.each do |word|
      word.in_word(dictionary).each do |slice|
        result << slice unless result.include?(slice)
      end
    end

    result
  end

  def in_word(dictionary)
    result = []
    chars.each_with_index do |letter, start_idx|
      (start_idx..length).each do |end_idx|
        slice = self[start_idx..end_idx]
        if !result.include?(slice) && dictionary.include?(slice)
          result << slice
        end
      end
    end
    result
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  (1..num).select{|n| num % n == 0}
end
