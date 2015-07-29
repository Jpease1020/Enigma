require_relative 'cipher'
require_relative 'decryptor'

class MessageCracker

  def initialize(encrypted_message)
    @encrypted_message = encrypted_message.reverse
  end

  def reverse_message_ending
    @encrypted_message[0..3].chars
  end

  def char_map_index
    reverse_message_ending.map do |char|
      Cipher.new.character_map.index(char)
    end
  end

  def fixed_rotation_component
    [2,2,26,16]
  end

  def rotations
    rotation = []
    fixed_rotation_component.each_with_index do |n, i|
      rotation << (n + char_map_index[i])
    end
    rotation
  end

  def crack_message
    rotation_index = 0
    encrypted_message = @encrypted_message.split('').map do |letter|
      rotation_index = 0 if (!rotation_index.zero?) && ((rotation_index) % 4 == 0)
      rotation_index += 1
      cipher = Cipher.new((-1)*rotations[rotation_index - 1])
      cipher.cipher[letter]
      end
    encrypted_message.join.reverse
  end

end
