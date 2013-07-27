require 'date'
require 'test/unit'

def key_with_max_value(h)
  max_key = h.keys.first
  max_value = h[max_key]

  h.each do |k, v|
    if v > max_value
      max_value = v
      max_key = k
    end
  end
  max_key
end


class TestHash < Test::Unit::TestCase
  def setup
    @h = {'d' => 1, 'a' => 3, 'c' => 4, 'b' => 2}
  end

  def test_key_with_max_value
    assert_equal 'c', key_with_max_value(@h)
  end
end


book = {
  'title' => 'Intro to Programming',
  'author' => 'Boris',
  'published_date' => Date.new(2013, 10, 1).strftime('%Y-%m-%d %H:%m'),
  'chapters' => [
    ['Getting Started', 1],
    ['Numbers', 9],
    ['Flow Control', 33],
    ['Arrays and Iterators', 60],
    ['Hash tables', 72],
    ['Conclusion', 102]
  ]
}

['title', 'author', 'published_date'].each{|k| puts book[k].center(80)}
book['chapters'].each_with_index {|c, ind|
  puts (ind + 1).to_s.ljust(10) + c[1].ljust(50) + c[2].to_s
}
