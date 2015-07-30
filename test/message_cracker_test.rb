require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/message_cracker'
require '../lib/encryptor'

class MessageCrackerTest < Minitest::Test

  def test_it_reverses_last_four_characters_in_encrypted_message
    encryptor = Encryptor.new("Hello ..end..", "072615","94321")
    encrypted_message = encryptor.encrypt
    message_cracker = MessageCracker.new(encrypted_message)

    result = message_cracker.reverse_message_ending

    assert_equal ["m","o","8","t"], result
  end

  def test_it_can_find_the_last_four_reversed_encrypted_letters_indexed_on_the_character_map
    encryptor = Encryptor.new("Hello ..end..", "072615","94321")
    encrypted_message = encryptor.encrypt
    message_cracker = MessageCracker.new(encrypted_message)

    result = message_cracker.char_map_index

    assert_equal [22, 24, 8, 29], result
  end

  def test_it_returns_fixed_character_map_distance_of_last_four_orignal_message
    result = MessageCracker.new("").fixed_rotation_component

    assert_equal [2,2,26,16], result
  end

  def test_it_can_calculate_the_original_message_rotations
    encryptor = Encryptor.new("Hello ..end..", "072615","94321")
    encrypted_message = encryptor.encrypt
    message_cracker = MessageCracker.new(encrypted_message)

    result = message_cracker.rotations

    assert_equal [24, 26, 34, 45], result
  end

  def test_it_can_decrypt_a_message
    crack = MessageCracker.new("2kg893wo,t8om")
    result = crack.crack_message
    assert_equal "hello ..end..", result
  end

  def test_it_can_decrypt_a_100_character_string_in_under_one_second
    crack = MessageCracker.new("gp8gizu3z1u.r8v8z6.aq8oxr1ayqtr3c8war1v3 8a.zu48s86tm1rwz1.grl8gfz.wzw4vj8.as83 d,rg9rn.m03gss.8d8txqxn3r9aga,rtj8ngkptgjtqwn8bhdyqh ")
    result = crack.crack_message
    assert_equal "hey john this is your best friend justin.  i just wanted to say good luck out there against those germans.  break a leg kiddo ..end..", result
  end


end
