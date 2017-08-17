require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  hashMap = HashMap.new(26)
  string.each_char do |char|
    if hashMap.include?(char)
      hashMap.set(char, hashMap.get(char)+1)
    else
      hashMap.set(char, 1)
    end
  end
  cnt = 0
  hashMap.each do |k, v|
    cnt += 1 if v.odd?
    return false if cnt > 1
  end
  true
end
