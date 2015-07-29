require 'minitest/autorun'
require 'minitest/pride'
require '../lib/decryptor'

class DecryptorTest < Minitest::Test

  def test_it_converts_negative_rotations_in_encryptor_class
    decryptor = Decryptor.new("Hello", "072615","94321")
    result = decryptor.negative_rotations

    assert_equal [-102, -45, -34, -26], result
  end

  def test_decryptor_decrypts
    encryptor = Encryptor.new("Hello", "072615","94321")
    encrypted_message = encryptor.encrypt

    message = Decryptor.new(encrypted_message, "072615","94321")
    result2 = message.decrypt

    assert_equal "hello", result2
  end

  def test_decryptor_decrypts_full_phrase_with_all_characters
    encryptor = Encryptor.new("Hello Jim, go kill Hitler.", "072615","94321")
    encrypted_message = encryptor.encrypt

    message = Decryptor.new(encrypted_message, "072615","94321")
    result2 = message.decrypt

    assert_equal "hello jim, go kill hitler.", result2
  end

end
