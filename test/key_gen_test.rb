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
    result1 = key1.key.length
    result2 = key2.key.length

    assert_equal 5, result1
    assert_equal 5, result2
  end

end
