require_relative 'offset'
class Encryptor

attr_reader :rotations
  def initialize(message, date = nil, key = nil)
    @message = message.downcase
    key_offset = OffsetCalculator.new(date, key)
    @rotations = key_offset.full_rotations
  end

  def character_map
    (0..9).to_a.map {|num| num.to_s } + ("a".."z").to_a + [" ", ".", ","]
  end

  def cipher(rotation)
    rotated_characters = character_map.rotate(rotation)
    Hash[character_map.zip(rotated_characters)]
  end

  def encrypt
      rotation_index = 0
      encrypted_message = @message.split("").map do |letter|
        rotation_index = 0 if (!rotation_index.zero?) && ((rotation_index) % 4 == 0)
        rotation_index += 1
        encrypt_character(letter, @rotations[rotation_index -1])
        end
      encrypted_message.join
  end


  def encrypt_character(letter, rotation)
      cipher_for_rotation = cipher(rotation)
      letter
      cipher_for_rotation
      cipher_for_rotation[letter]
  end

end
