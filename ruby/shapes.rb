def ljust_triangle(n)
  return nil unless (1..9).include?(n)
  (1..n).each do |x|
    puts (x.to_s + " ") * x
  end
end

def rjust_triangle(n)
  return nil unless (1..20).include?(n)
  (1..n).each do |x|
    s = (x.to_s + " ") * x
    puts s.rjust(20)
  end
end

def pyramid(n)
  return nil unless (1..20).include?(n)
  count = 1
  (1..n).each do |x|
    s = (x.to_s + " ") * count
    puts s.center(20)
    count += 2
  end
end

def trapezoid(n, m)
  return if n < 1
  return if m > 9
  return if n > m
  (n..m).each do |x|
    s = (x.to_s + " ") * x
    puts s.center(20)
  end
end

def rectangle(a, b)
  return if a < 1 || a > 80
  return if b < 1
  b.times do
    s = "*" * a
    puts s.center(80)
  end
end

ljust_triangle(6)
rjust_triangle(6)
pyramid(5)
trapezoid(3, 7)
rectangle(3, 9)