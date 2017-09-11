class Array

  def my_each(&prc)
    for i in 0...length
      prc.call(self[i])
    end

    self
  end

  def my_select(&prc)
    selected = []

    my_each{|el|selected << el if prc.call(el)}

    selected 
  end

  def my_reject(&prc)
    rejected = []
    my_each{|el|rejected << el unless prc.call(el)}
    rejected
  end 

  def my_any?(&prc)
    self.my_each{ |num| return true if prc.call(num)}
    false
  end

  def my_any?(&prc)
    my_each{|el|return true if prc.call(el)}
    false
  end


  def my_all?(&prc)
    my_each{ |num| return false unless prc.call(num)}
    true
  end

  def my_flatten
    answer = []
    self.each do |el|
      el.is_a?(Fixnum) ? (answer << el) : (answer += el.my_flatten)
    end
    answer
  end

  def my_rotate(num=1)
    n = num % length
    # original
    # self[n..-1] + self[0...n]
  
    #refactor
    drop(n) + take(n)
  end

  def my_join(separator="")
    answer = ""
    (self.length - 1).times do |i|
      answer << self[i] + separator
    end

    answer + self[-1]
  end

  def my_reverse
    reversed = []

    my_each{|el|reversed.unshift(el)}

    reversed
  end

  def my_zip(*array)
    zipped = []

    self.length.times do |i|
      subzip = [self[i]]
      array.each do |el|
        subzip << el[i]
      end
      zipped << subzip
    end
    zipped

  end
end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
#  p ([1, 2, 3].my_zip(a, b) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]])
#  p (a.my_zip([1,2], [8]) == [[4, 1, 8], [5, 2, nil], [6, nil, nil]])
# p [1, 2].my_zip(a, b) == [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d) == [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
# puts [ "a", "b", "c" ].my_reverse == ["c", "b", "a"]
# puts [ 1 ].my_reverse  == [1]

# a = [ "a", "b", "c", "d" ]
# puts a.my_join == "abcd"
# puts a.my_join("$") == "a$b$c$d"
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate
# p a.my_rotate == ["b", "c", "d", "a"]
# p a.my_rotate(2) == ["c", "d", "a", "b"]
# p a.my_rotate(-3)== ["b", "c", "d", "a"]
# p a.my_rotate(15)== ["d", "a", "b", "c"]

# calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#  puts num
# end.my_each do |num|
#  puts num
# end
# => 1
#     2
#     3
#     1
#     2
#     3
#
# p return_value  # => [1, 2, 3]
#
# p [1,2,3].my_each{|num| puts num}
#
# a = [1, 2, 3]
# puts "select _____________"
# puts a.my_select { |num| num > 1 }  == [2, 3]
# puts a.my_select { |num| num == 4 }  == []
# puts "reject______________"
# puts a.my_reject { |num| num > 1 }  == [1]
# puts a.my_reject { |num| num == 4 }  == [1, 2, 3]
# puts "any_________________"

# puts a.my_any? { |num| num > 1 }  == true
# puts a.my_any? { |num| num == 4 }  == false
# puts "all_________________"
# puts a.my_all? { |num| num > 1 }  == false
# puts a.my_all? { |num| num < 4 }  == true
# puts "flatten_____________"
# puts [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# puts  "zip________________"
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8]) == [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b) == [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d) == [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
