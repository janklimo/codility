require 'minitest/autorun'

class PassingCarsTests < Minitest::Test
  def solution(a)
    passing = 0
    easts = 0
    a.each do |direction|
      if direction == 0
        easts += 1
      else
        passing += easts
      end
      return -1 if passing > 1_000_000_000
    end
    passing
  end

  def test_example_input
    assert_equal 5, solution([0, 1, 0, 1, 1])
  end

  def test_empty
    assert_equal 0, solution([])
  end
end
