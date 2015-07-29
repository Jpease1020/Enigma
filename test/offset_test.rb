# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/offset'
require '../lib/key_generator'

class OffsetCalculatorTest < Minitest::Test

  def test_date_can_be_taken_into_offsetcalculator_machine
    offset = OffsetCalculator.new("072513", "83742")

    assert_equal "072513", offset.date
  end

  def test_it_initializes_a_key_object
    offset = OffsetCalculator.new("072513","92345")

    assert_equal KeyGenerator, offset.key.class
  end

  def test_date_gets_squared
    offset = OffsetCalculator.new("072515", "84903")
    result = offset.squared

    assert_equal 5258425225, result
  end

  def test_last_four_digits_are_used
    offset = OffsetCalculator.new("072515", "73849")
    result = offset.last_four

    assert_equal"5225", result
  end

  def test_offset_a_is_created
    offset = OffsetCalculator.new("072515", "08723")

    assert_equal 5, offset.offset_a
  end

  def test_offset_b_is_created
    offset = OffsetCalculator.new("072515", "80231")

    assert_equal 2, offset.offset_b
  end

  def test_offset_c_is_created
    offset = OffsetCalculator.new("072515", "84920")

    assert_equal 2, offset.offset_c
  end

  def test_offset_d_is_created
    offset = OffsetCalculator.new("072515", "234225524q24")

    assert_equal 5, offset.offset_d
  end

  def test_offset_a_is_added_to_rotation_a
    offset = OffsetCalculator.new("072515","98234")
    result = offset.full_rotation_a

    assert_equal 103, result
  end

  def test_offset_b_is_added_to_rotation_b
    offset = OffsetCalculator.new("072515","98234")
    result = offset.full_rotation_b

    assert_equal 84, result
  end

  def test_offset_c_is_added_to_rotation_c
    offset = OffsetCalculator.new("072515","98234")
    result = offset.full_rotation_c

    assert_equal 25, result
  end

  def test_offset_d_is_added_to_rotation_d
    offset = OffsetCalculator.new("072515","98234")
    result = offset.full_rotation_d

    assert_equal 39, result
  end

  def test_full_rotations_returns_each_full_rotation
    offset = OffsetCalculator.new("072515","98234")
    result = offset.full_rotations

    assert_equal [103,84,25,39], result
  end

  def test_rotation_a_can_be_pulled_from_full_rotations
    offset = OffsetCalculator.new("072515","98234")
    result = offset.full_rotations[0]

    assert_equal 103, result
  end

end
