require 'minitest/autorun'

class PermCheckTests < Minitest::Test
  def solution(a)
    seen = {}

    a.each do |item|
      return 0 if item > a.size
      seen[item] = true
    end

    seen.size == a.size ? 1 : 0
  end

  def test_example_input
    assert_equal 1, solution([4, 1, 3, 2])
  end

  def test_one
    assert_equal 1, solution([1])
  end

  def test_one_bad
    assert_equal 0, solution([6])
  end

  def test_bad
    assert_equal 0, solution([4,1,3])
  end
end
