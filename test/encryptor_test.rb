# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encryptor'

class EncryptorTest < Minitest::Test

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
