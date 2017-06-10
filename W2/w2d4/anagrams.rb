def first_anagram?(str_one, str_two)

end

def third_anagram?(str_one, str_two)
  str_one.chars.sort == str_two.chars.sort
end

a = Time.now
# p anagram?("gizmo", "sally")
p third_anagram?("elvisabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz", "livesaopqrstbcdefghijklmnuvwxyzabcdefghijklmnopqrstabcdefghijklmnopqrstuvwxyzuvwxyz")
p Time.now - a
