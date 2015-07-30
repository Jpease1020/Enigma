require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cipher'

class CipherTest < Minitest::Test

  def test_character_map_returns_specific_values
    cipher = Cipher.new(0)
    result = cipher.character_map[0]
    result1 = cipher.character_map[10]

    assert_equal "0", result
    assert_equal "a", result1
  end

  def test_cipher_rotates_characters_by_2_rotations
    cipher = Cipher.new(2)
    result = cipher.cipher

    assert_equal "c", result["a"]
  end

  def test_cipher_rotates_characters_by_negative_3_rotations
    cipher = Cipher.new(-3)
    result = cipher.cipher["0"]

    assert_equal " ", result
  end

end
