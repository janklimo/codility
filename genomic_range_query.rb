require 'minitest/autorun'

class GenomicRangeTests < Minitest::Test
  def solution(s, p, q)
    letters = %w(A C G T)

    prefix_sums = Hash.new { |h, k| h[k] = Array.new(s.size + 1, 0) }

    s.chars.each_with_index do |char, i|
      letters.each do |letter|
        prefix_sums[letter][i + 1] = prefix_sums[letter][i]
      end
      prefix_sums[char][i + 1] = prefix_sums[char][i] + 1
    end

    p.zip(q).map do |from, to|
      letters.index do |letter|
        prefix_sums[letter][to + 1] - prefix_sums[letter][from] > 0
      end + 1
    end
  end

  def test_example_input
    assert_equal [1, 1, 2, 4], solution("GACACCATA", [0, 0, 4, 7], [8, 2, 5, 7])
  end
end
