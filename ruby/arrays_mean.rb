# Given array, find the average of its values
# e.g., avg([1,2,3]) should return 2

require 'test/unit'

def average_v1(a)
  return nil if a.size == 0
  sum = 0.0
  a.each do |x|
    sum += x
  end
  return sum / a.size
end


def average_v2(a)
  return nil if a.size == 0
  return a.inject(0.0) { |s, x| s + x } / a.size
end

class TestMean < Test::Unit::TestCase
  def setup
    @a = [3, 9, 9, 9, 2, 2, 2, 8, 7, 5]
  end

  def test_average_v1
    assert !average_v1([])
    assert_equal 1.5, average_v1([1, 2])
    assert_in_delta 5.601, average_v1(@a), 0.01
    assert_equal 1, average_v1([1])
  end
end

# Given a list of list, find the sum of all elements
# Alternative, write a deep iterator (apply to Google)
def sum(a)
  a.flatten.inject(0) { |sum, x| sum + x }
end

sum([[3, 4], [], [1, 3, 5], [6]])  # => 22
