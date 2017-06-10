def four_sum(array, target)
  sums_hash = {}
  array.each_with_index do |el, i|
    array.each_with_index do |el2, j|
      next if i <= j

      p "#{[i, j]} = #{(el + el2)}"
      sums_hash[el + el2] = [i, j]
    end
  end

  sums_hash.keys.each do |sum|
    if sums_hash[target - sum] &&
        (sums_hash[sum] + sums_hash[target - sum]).uniq.length == 4

      p (sums_hash[sum] + sums_hash[target - sum]).uniq
      return true
    end
  end
  false
end

p four_sum([5, 5, 3, 7, 2, 1], 13)
