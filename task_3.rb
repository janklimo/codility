require 'minitest/autorun'

class Tree
  attr_reader :n, :l, :r

  def initialize(n, l, r)
    @n = n
    @l = l
    @r = r
  end
end

class Task3Tests < MiniTest::Test
  def solution(tree)
    # starting at 1, since root is included in the path
    1 + max_depth(tree)
  end

  def max_depth(tree)
    return 0 unless %i(l r).any? { |m| tree.respond_to? m }
    return 0 if %i(l r).all? { |m| tree.send(m).nil? }

    1 + [max_depth(tree.l), max_depth(tree.r)].max
  end

  #    1
  #   / \
  #  2   3
  #
  def test_simple_input
    tree = Tree.new(1, 2, 3)
    assert_equal 2, solution(tree)
  end

  #      1
  #     / \
  #  nil   nil
  #
  def test_tree_with_nil_branches
    tree = Tree.new(1, nil, nil)
    assert_equal 1, solution(tree)
  end

  #      1
  #     / \
  #    2   3
  #   / \
  #  4   5
  #
  def test_more_complex_input
    sub_tree = Tree.new(2, 4, 5)
    tree = Tree.new(1, sub_tree, 3)
    assert_equal 3, solution(tree)
  end

  #        1
  #       / \
  #      2   3
  #     / \   \
  #    4   5   6
  #       / \
  #      7   8
  #     /     \
  #    11      9
  #             \
  #              10
  #
  def test_complex_input
    tree = Tree.new(
      1,
      Tree.new(
        2,
        4,
        Tree.new(
          5,
          Tree.new(7, 11, nil),
          Tree.new(
            8,
            nil,
            Tree.new(9, nil, 10)
          )
        )
      ),
      Tree.new(3, nil, 6)
    )
    assert_equal 6, solution(tree)
  end
end
