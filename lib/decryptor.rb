require_relative 'encryptor'
class Decryptor

  def initialize(encrypted_message, date, key)
    @decrypt = Encryptor.new(encrypted_message,date,key)
  end

  def negative_rotations
    negative_rotations = @decrypt.rotations.map! do |rotation|
      rotation * (-1)
    end
    negative_rotations
  end

  def decrypt
    negative_rotations
    @decrypt.encrypt
  end

end
