# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/offset'

class OffsetTest < Minitest::Test

  def test_date_can_be_taken_into_offset_machine
    offset = Offset.new("072513")
    assert_equal "072513", offset.date
  end

  def test_date_gets_squared
    offset = Offset.new("072515")
    result = offset.squared
    assert_equal 5258425225, result
  end

  def test_last_four_digits_are_used
    offset = Offset.new("072515")
    result = offset.last_four
    assert_equal"5225", result
  end

  def test_offset_a_is_created
    offset = Offset.new("072515")
    assert_equal 5, offset.offset_a
  end

  def test_offset_b_is_created
    offset = Offset.new("072515")
    assert_equal 2, offset.offset_b
  end

  def test_offset_c_is_created
    offset = Offset.new("072515")
    assert_equal 2, offset.offset_c
  end

  def test_offset_d_is_created
    offset = Offset.new("072515")
    assert_equal 5, offset.offset_d
  end

end
