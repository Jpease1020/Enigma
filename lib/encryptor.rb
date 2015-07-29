require_relative 'offset'
require_relative 'cipher'

class Encryptor

attr_accessor :rotations
  def initialize(message, date = nil, key = nil)
    @message = message.downcase.split("")
    key_offset = OffsetCalculator.new(date, key)
    @rotations = key_offset.full_rotations
  end

  def encrypt
      rotation_index = 0
      encrypted_message = @message.map do |letter|
        rotation_index = 0 if (!rotation_index.zero?) && ((rotation_index) % 4 == 0)
        rotation_index += 1
        encrypt_character(letter, @rotations[rotation_index -1])
        end
      encrypted_message.join
  end


  def encrypt_character(letter, rotation)
      cipher_for_rotation = Cipher.new(rotation)
      cipher_for_rotation.cipher[letter]
  end

end
