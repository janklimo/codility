require 'minitest/autorun'

class DistinctTests < MiniTest::Test
  def solution(a)
    a.uniq.size
  end

  def test_example_input
    assert_equal 3, solution([6, 11, 2])
  end

  def test_duplicates
    assert_equal 2, solution([6, 6, 5, 5, 5, 6, 5])
  end
end
