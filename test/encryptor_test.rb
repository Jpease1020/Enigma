# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_character_map_returns_specific_values
    encryptor = Encryptor.new("Hello", "072615","94321")
    result = encryptor.character_map[0]
    result1 = encryptor.character_map[10]

    assert_equal "0", result
    assert_equal "a", result1
  end

  def test_cipher_rotates_characters_by_2_rotations
    encryptor = Encryptor.new("Hello", "072615","94321")
    cipher = encryptor.cipher(2)
    result = cipher["0"]

    assert_equal "2", result
  end

  def test_cipher_rotates_characters_by_negative_3_rotations
    encryptor = Encryptor.new("hello", "072615","94321")
    cipher = encryptor.cipher(-3)
    result = cipher["0"]

    assert_equal " ", result
  end

  def test_encrypt_character_encrypts_a_letter
    encryptor = Encryptor.new("hello", "072615","94321")
    result = encryptor.encrypt_character("h", 6)

    assert_equal "n",result
  end

  def test_a_single_character_message_is_encrypted_by_6_rotations
    encryptor = Encryptor.new("a", "072515", "01234")
    result = encryptor.encrypt

    assert_equal "g", result
  end

  def test_encrypts_a_character
    encryptor = Encryptor.new(".", "072515", "04321")
    result = encryptor.encrypt

    assert_equal "7", result
  end

  def test_encrypts_a_number
    encryptor = Encryptor.new("4", "072515", "01321")
    result = encryptor.encrypt

    assert_equal "a", result
  end

  def test_one_word_message_is_encrypted
    encryptor = Encryptor.new("Jack", "072515", "00000")
    result = encryptor.encrypt

    assert_equal "ocep", result
  end

  def test_a_sentence_is_encrypted
    encryptor = Encryptor.new("Hello world I am Justin.", "072515", "78663")
    result = encryptor.encrypt

    assert_equal "mobbt7mewv3qn70c2tkiysdr", result
  end

  def test_a_message_with_all_types_of_characters_gets_encrypted
    encryptor = Encryptor.new("Hello, this the number 2.", "072515", "78663")
    result = encryptor.encrypt

    assert_equal "mobbt9qjmsiqyr4qs1c1j.qv3", result
  end

end
