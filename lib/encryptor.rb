require_relative 'offset'
require_relative 'cipher'

class Encryptor

  attr_accessor :rotations, :key
  attr_reader :date
  def initialize(message, date = nil, key = nil)
    @message = message.downcase
    if valid_message(@message) == false
      raise ArgumentError.new("#{@message} is invalid, please try again")
    else
      @message = message.downcase.split("")
    end
    key_offset = OffsetCalculator.new(date, key)
    @rotations = key_offset.full_rotations
    @key = key_offset.key
    @date = date
  end

  def valid_message(message)
    message.chars.all? do |letter|
       Cipher.new.character_map.include?(letter)
     end
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
