# Anagrams
# Check if a string is an anagram of another string
# Two strings are anagrams, if they can be formed from
# the same list of chars
# ["step", "pest"), ("stop", "spot")]
#
# Challenge: reverse the chars in your name and prove that
#the resulting string is an anagram of your name

require "test/unit"


def anagrams_v1?(w1, w2)
  w1.chars.sort.join == w2.chars.sort.join
end


def string_to_hash(s)
  h = {}
  s.each_char {|c| h[c] = h[c].nil? ? 1 : h[c] + 1}
  h
end


def anagrams_v2?(s, t)
  string_to_hash(s) == string_to_hash(t)
end


class TestAnagrams < Test::Unit::TestCase
  def test_anagram_v1
    assert anagrams_v1?("spot", "stop")
    assert !anagrams_v1?("spot", "spo")
    assert anagrams_v1?("", "")
  end

  def test_anagram_v2
    assert anagrams_v2?("step", "pest")
    assert !anagrams_v2?("step", "")
    assert anagrams_v2?("", "")
  end
end
