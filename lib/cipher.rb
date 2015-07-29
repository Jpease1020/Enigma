class Cipher

  def initialize(rotation = 0)
    @rotation = rotation
  end

  def character_map
    (0..9).to_a.map {|num| num.to_s } + ("a".."z").to_a + [" ", ".", ","]
  end

  def cipher
    rotated_characters = character_map.rotate(@rotation)
    Hash[character_map.zip(rotated_characters)]
  end

end
