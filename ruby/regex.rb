require "test/unit"

class TestPriceRegex < Test::Unit::TestCase
  def setup
    @re = /^\d+\.\d\d$/.match(s)
  end

  def test_price_regex
    assert @re.match("24.60")
    assert @re.match(".65")
    assert /^\${0,1}\d*\.\d\d$/.match("24.60")
    assert /^\${0,1}\d*\.\d\d$/.match("$5.45")
    /^d.g$/.match("dog")
  end

  def test_suffixes
    words = %w{difference urgency silken confidence frozen wooden agency}
    matches = words.select{|w| w.match(/ence|ency/)}
    assert_equal 4, matches.size
  end
end
