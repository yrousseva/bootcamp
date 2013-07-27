# Reverse a string.
# reverse("abcd") # => "dcba"

def reverse_v1(s)
  (s.size-1).downto(0).inject("") { |r, i| r << s[i] }
end

def reverse_v2(s)
  r = ""
  (s.size-1).downto(0) { |i| r << s[i] }
  r
end

