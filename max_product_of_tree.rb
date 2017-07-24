require 'minitest/autorun'

class MaxProductOfTreeTests < Minitest::Test
  def solution(a)
    a.sort! # sort in place
    [
      a[0] * a[1] * a[2],
      a[0] * a[1] * a[-1],
      a[0] * a[-1] * a[-2],
      a[-1] * a[-2] * a[-3],
    ].max
  end

  def test_example_input
    assert_equal 60, solution([-3, 1, 2, -2, 5, 6])
  end

  def test_negative_bigger
    assert_equal 600, solution([-20, -10, 0, 3])
  end

  def test_one_triple
    assert_equal(-80, solution([-10, -2, -4]))
  end
end
