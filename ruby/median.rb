# Write a method median which takes a list of
# numbers and returns the median value.

def median(a)
  a.sort!
  if a.size % 2 == 1
    a[a.size / 2]
  else
    m = a.size / 2
    (a[m-1] + a[m]) / 2.0
  end
end

tests = [[3],  [2,3], [1, 3, 2], [4, 5, 6, 7], [2, 5, 5, 6]]
tests.each do |a|
  puts "#{a.join(',')}: #{median(a)}"
end
