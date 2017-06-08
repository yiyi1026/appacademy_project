class Array

  def my_uniq
    uniq_arr = []
    each do |el|
      uniq_arr << el unless uniq_arr.include?(el)
    end

    uniq_arr
  end

  def two_sum
    result = []
    each_index do |index_start|
      (index_start+1...length).each do |index_end|
        if self[index_start] + self[ index_end] == 0
          result << [index_start, index_end]
        end
      end
    end
    result
  end

  def my_transpose
    new_matrix = Array.new(length) {Array.new(self[0].length)}
    each_with_index do |row, i|
      row.each_index do |j|
        new_matrix[i][j] = self[j][i]
      end
    end
    new_matrix
  end

  def stock_picker
    pair = [0,1]
    each_index do |index_start|
      (index_start+1...length).each do |index_end|
        if self[ index_end] -self[index_start] > self[pair[1]] - self[pair[0]]
          pair = [index_start, index_end]
        end
      end
    end
    pair
  end


end
