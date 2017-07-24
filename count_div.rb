require 'minitest/autorun'

class CountDivTests < MiniTest::Test
  def solution(a, b, k)
    b/k - a/k + ((a % k) == 0 ? 1 : 0)
  end

  def test_example_input
    assert_equal 3, solution(6, 11, 2)
  end

  def test_no_result
    assert_equal 0, solution(6, 11, 200)
  end

  def test_zeros
    assert_equal 1, solution(0, 0, 200)
  end
end
