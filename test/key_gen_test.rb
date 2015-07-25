# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_thing_exists
    key = KeyGenerator.new("74658")
    assert_equal "74658", key.key
  end

  def test_if_no_key_given_a_random_number_key_is_generated
    key = KeyGenerator.new
    assert key.key.is_a?(String)
  end

  def test_invalid_key_with_letter_defaults_to_random_key
    key = KeyGenerator.new("231j6")
    result = key.key
    refute_equal "231j6", result
    refute result =~ /[a-z]/
    ############  we need a better test
  end

  def test_key_invalid_if_input_length_is_greater_or_less_than_5
    key1 = KeyGenerator.new("84990")
    key2 = KeyGenerator.new("231345345236")
    key3 = KeyGenerator.new("840")
    result1 = key1.key.length
    result2 = key2.key.length
    result3 = key3.key.length
    assert_equal 5, result1
    assert_equal 5, result2
    assert_equal 5, result3
  end

  def test_key_rotation_a_is_created
    key = KeyGenerator.new("84795")
    assert_equal 84, key.a_rotation
  end

  def test_key_rotation_a_is_created_if_zero_is_the_first_digit
    key = KeyGenerator.new("04795")
    assert_equal 4, key.a_rotation
  end

  def test_key_rotation_b_is_created
    key = KeyGenerator.new("70839")
    assert_equal 8, key.b_rotation
  end

  def test_key_rotation_c_is_created
    key = KeyGenerator.new("02819")
    assert_equal 81, key.c_rotation
  end

  def test_key_rotation_d_is_created
    key = KeyGenerator.new("74033")
    assert_equal 33, key.d_rotation
  end

end
