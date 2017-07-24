require 'minitest/autorun'

class MissingIntTests < MiniTest::Test
  def solution(a)
    arr = []
    a.each { |e| arr[e] = 1 if e > 0 && e <= 100_000 }

    (1..100_001).each do |i|
      return i unless arr[i]
    end
  end

  def test_example_input
    assert_equal 5, solution([1, 3, 6, 4, 1, 2])
  end

  def test_single_input
    assert_equal 2, solution([1])
  end

  def test_negative_input
    assert_equal 1, solution([-231])
  end

  def test_large_input
    assert_equal 1, solution([-2147483648, 2147483647])
  end

  def test_large_example_input
    array = Array(1..899_900) - [333]
    assert_equal 333, solution(array)
  end

  def test_nothing_missing
    array = Array(1..100_000)
    assert_equal 100_001, solution(array)
  end
end
