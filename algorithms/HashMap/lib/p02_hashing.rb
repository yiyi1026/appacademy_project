class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0
    each do |el|
      hash += 31 * hash +  el.hash
    end
    hash
  end
end

class String
  def hash
    hash = 0
    each_char do |char|
      hash = 31 * hash + char.ord
    end
    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    h = 0
    each do |key, val|
      h += key.hash + val.hash
    end
    h
  end
end
