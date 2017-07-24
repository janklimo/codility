require 'minitest/autorun'

# http://howtoprogram.eu/question/ruby-reduce-how-does-using-array-reduce-in-this-way-work,38550
#
class OddOccurencesTests < MiniTest::Test
  def solution(a)
    a.reduce(:^)
  end

  def test_example_input
    assert_equal 7, solution([9, 3, 9, 3, 9, 7, 9])
  end
end
