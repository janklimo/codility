def solution(a, k)
  return a if a.empty?

  a.tap do |array|
    k.times { a.unshift(a.pop) }
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Test
  def test_example_input
    assert_equal [4, 1, 2, 3], solution([1, 2, 3, 4], 1)
  end

  def test_multiple_rotations
    assert_equal [2, 3, 4, 1], solution([1, 2, 3, 4], 3)
  end

  def test_empty
    assert_equal [], solution([], 5)
  end
end
