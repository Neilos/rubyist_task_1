require 'minitest'
require 'minitest/autorun'
require '../lib/array'

class ArrayTest < Minitest::Test

  def test_inject_without_initial_value
    array = [1,2,3,4]   
    result = array.inject do |sum, value|
      sum + value * 2
    end
    assert_equal 19, result
  end

  def test_inject_with_initial_value
    array = [1,2,3,4]   
    result = array.inject(5) do |sum, value|
      sum + value * 2
    end
    assert_equal 25, result
  end

  def test_inject_with_one_element_array
    assert_equal 8, [5].inject(3) {|sum, value| sum + value}
  end

  def test_inject_with_empty_array
    assert_equal 3, [].inject(3) {|sum, value| sum + value}
  end

  def test_reduce_sum
    array = [1,2,3,4]
    assert_equal 10, array.reduce(:+)
  end

  def test_reduce_product
    array = [1,2,3,4]
    assert_equal 24, array.reduce(:*)
  end

  def test_reduce_one_element_array
    array = [5]
    assert_equal 5, array.reduce(:+)
    assert_equal 5, array.reduce(:*)
  end

  def test_reduce_empty_array
    array = []
    assert_equal nil, array.reduce(:+)
    assert_equal nil, array.reduce(:*)
  end

end