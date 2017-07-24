require 'minitest/autorun'

class TapeEqTests < Minitest::Test
  def solution(a)
    minimum = nil
    sum_left = 0
    sum_right = a.inject(:+)

    (1..a.size-1).each do |i|
      sum_left += a[i-1]
      sum_right -= a[i-1]
      difference = (sum_left - sum_right).abs
      minimum = difference if !minimum || difference < minimum
    end

    minimum
  end

  def test_example_input
    assert_equal 1, solution([3, 1, 2, 4, 3])
  end

  def test_pair
    assert_equal 2000, solution([1000, -1000])
  end

  def test_negative
    assert_equal 3, solution([-10, -5, -3, -4, -5])
  end
end
