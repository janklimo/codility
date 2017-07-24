require 'minitest/autorun'

class DominatorTests < Minitest::Test
  def solution(a)
    candidate = nil
    count = 0

    # majority vote algorithm
    a.each do |value|
      candidate = value if count == 0
      if candidate == value
        count += 1
      else
        count -= 1
      end
    end

    count = 0

    a.each do |value|
      count += 1 if value == candidate
    end

    (count > a.size / 2) ? candidate : -1
  end

  def test_example
    assert_equal 3, solution([3, 4, 3, 2, 3, -1, 3, 3])
  end

  def test_empty
    assert_equal(-1, solution([]))
  end

  def test_no_major
    assert_equal(-1, solution([1, 1, 2, 2, 3, 3]))
  end
end
