require 'date'

first = Date.new(2012, 10, 1)
second = Date.new(2012, 10, 2)
today = Date.today

# compare dates
d = first < second ? first : second
puts d.strftime('%B %d, %Y')

# sort dates
dates = [today, second, first]
puts dates.sort

puts first.to_time.to_i # => seconds since the beginning of the epoch, January 1, 1960
puts Time.new # current time
puts Time.now # current time