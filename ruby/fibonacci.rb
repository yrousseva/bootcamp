# Calculate the fibonacci n
# fib(1)  # => 1
# fib(2)  # => 1
# find(3) # => fib(1) + fib(2)
# fib(n)  # => fib(n-2) + fib(n-1)

require 'test/unit'
require 'benchmark'

def fib_recursive(n)
  return nil if n < 1
  return 1 if [1, 2].include?(n)
  return fib_recursive(n-1) + fib_recursive(n-2)
end


def fib_iterative(n)
  return nil if n < 1
  return 1 if n == 1 || n == 2

  prev_prev = 1
  prev = 1
  curr = nil

  3.upto(n) do
    curr = prev_prev + prev
    prev_prev = prev
    prev = curr
  end
  curr
end


class TestFibonacci < Test::Unit::TestCase
  def test_fib_recursive
    assert_equal 1, fib_recursive(1)
    assert_nil fib_recursive(0)
    assert_equal 8, fib_recursive(5)
  end

  def test_fib_iterative
    assert_equal 1, fib_iterative(1)
    assert_nil fib_iterative(0)
    assert_equal 8, fib_iterative(5)
  end
end


def measure_naive(n)
  start = Time.now
  r = fib_iterative(n)
  seconds = Time.now - start
  puts "Iterative fibonacci took #{seconds} to compute fib(#{n}): #{r}"
end

measure_naive(10**3)


Benchmark.bm do |x|
  x.report { fib_iterative(35) }
  x.report { fib_recursive(35) }
end
