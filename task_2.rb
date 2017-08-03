require 'minitest/autorun'

class Task2Tests < MiniTest::Test
  def solution(a, d)
    # setup stones array: add both banks
    stones = [-1, a.size]
    max_time = a.max

    (0..100_000).each do |time|
      break if time > max_time
      position = a.find_index(time)
      stones << position if position
      return time if can_cross?(stones, d)
    end

    -1
  end

  def can_cross?(stones, d)
    max_gap = 0
    stones.sort.each_cons(2) do |pair|
      diff = pair[1] - pair[0]
      max_gap = diff if diff > max_gap
      return false if max_gap > d
    end
    max_gap <= d
  end

  def test_can_cross?
    assert_equal true, can_cross?([0, 2, 3, 4], 2)
  end

  def test_cannot_cross_unsorted
    assert_equal false, can_cross?([3, 2, 4, 1, 9, -1], 4)
  end

  def test_basic_input
    assert_equal 3, solution([3, 2, 1], 1)
  end

  def test_impossible_path
    assert_equal(-1, solution([3, -1, 2, 1], 1))
  end

  def test_more_complex_input
    assert_equal 2, solution([1, -1, 0, 2, 3, 5], 3)
  end
end
