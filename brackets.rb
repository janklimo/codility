require 'minitest/autorun'

class BracketsTests < Minitest::Test
  def solution(s)
    closing_pair = {
      '{' => '}',
      '(' => ')',
      '[' => ']',
    }

    stack = []
    s.chars.each do |char|
      case char
      when '(', '{', '['
        stack << char

      when ')', '}', ']'
        top = stack.pop
        return 0 if closing_pair[top] != char
      end
    end

    stack.empty? ? 1 : 0
  end

  def test_example_input
    assert_equal 0, solution('([)()]')
  end

  def test_empty
    assert_equal 1, solution('')
  end

  def test_success
    assert_equal 1, solution('()()')
  end

  def test_succes2
    assert_equal 1, solution('{[()()]}')
  end

  def test_fail
    assert_equal 0, solution('()(')
  end
end
