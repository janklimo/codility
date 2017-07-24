# http://stackoverflow.com/a/7139391/233852

require 'minitest/autorun'

class TriangleTests < Minitest::Test
  def solution(a)
    a.sort!
    a.each_cons(3) do |side_a, side_b, side_c|
      next if side_c <= 0
      return 1 if side_a + side_b > side_c
    end
    0
  end

  def test_example_input
    assert_equal 0, solution([10, 50, 5, 1])
  end

  def test_success
    assert_equal 1, solution([10, 2, 5, 1, 8, 20])
  end

  def test_success2
    assert_equal 1, solution([10,0, -10, 2, 5,5, 1, 8, 20])
  end

  def test_large2
    assert_equal 1, solution([1] + 20.step(100_000, 2).to_a + [1, 5, 10])
  end
end
