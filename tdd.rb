require 'minitest/autorun'
require_relative 'string_calculator'

class TestStringCalculator < Minitest::Test
  def test_add_empty_string
    assert_equal 0, StringCalculator.add("")
  end

  def test_add_single_number
    assert_equal 1, StringCalculator.add("1")
  end

  def test_add_two_numbers
    assert_equal 6, StringCalculator.add("1,5")
  end

  def test_add_multiple_numbers
    assert_equal 10, StringCalculator.add("1,2,3,4")
  end

  def test_add_new_line_as_delimiter
    assert_equal 6, StringCalculator.add("1\n2,3")
  end

  def test_add_custom_delimiter
    assert_equal 3, StringCalculator.add("//;\n1;2")
  end

  def test_add_negative_number
    assert_raises(Exception) { StringCalculator.add("1,-2,3") }
  end

  def test_add_multiple_negative_numbers
    exception = assert_raises(Exception) { StringCalculator.add("1,-2,3,-4") }
    assert_equal "Negative numbers not allowed: -2, -4", exception.message
  end
end
