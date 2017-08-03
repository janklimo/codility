require 'minitest/autorun'

class Task1Tests < MiniTest::Test
  def solution(a)
    sorted_array = a.sort
    swaps_count = 0

    # return to avoid iterations if arrays are identical
    return true if a == sorted_array

    sorted_array.each_with_index do |e, i|
      swaps_count +=1 unless e == a[i]
      # break since every extra iteration would be wasteful
      break if swaps_count > 2
    end

    swaps_count <= 2 ? true : false
  end

  def test_doable_input
    assert_equal true, solution([1, 5, 3, 3, 7])
  end

  def test_impossible_input
    assert_equal false, solution([1, 3, 5, 3, 4])
  end

  def test_already_sorted
    assert_equal true, solution([1, 3, 5])
  end

  def test_empty
    assert_equal true, solution([])
  end
end
