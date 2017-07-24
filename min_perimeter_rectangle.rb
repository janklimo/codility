require 'minitest/autorun'

class MinPerimeterTests < Minitest::Test
  def solution(n)
    minimum = 1 / 0.0 # Infinity

    1.upto(Math.sqrt(n).floor).each do |a|
      next if n.modulo(a) > 0
      b = n / a
      perimeter = 2 * (a + b)
      minimum = perimeter if minimum > perimeter
    end

    minimum
  end

  def test_example_input
    assert_equal 22, solution(30)
  end
end
