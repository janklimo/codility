require 'minitest/autorun'

class BinaryGapTests < MiniTest::Test
  def solution(n)
    # convert to binary and remove leading and trailing zeros
    binary = n.to_s(2).gsub(/^0*|0*\z/, "")
    longest_gap = binary.split('1').sort_by { |gap| gap.length }.last
    longest_gap ? longest_gap.length : 0
  end

  def test_example_input
    assert_equal 9, solution(1025)
  end

  def test_trailing_zeros
    assert_equal 2, solution(200)
  end

  def test_no_gap
    assert_equal 0, solution(15)
  end
end
