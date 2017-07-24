require 'minitest/autorun'

class FrogJumpTests < Minitest::Test
  def solution(x, y, d)
    ((y - x) / d.to_f).ceil
  end

  def test_example_input
    assert_equal 3, solution(10, 85, 30)
  end

  def test_no_jump_needed
    assert_equal 0, solution(10, 10, 30)
  end

  def test_exact_jump
    assert_equal 3, solution(0, 90, 30)
  end
end
