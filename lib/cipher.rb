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


# (0..9).to_a.map {|num| num.to_s } + ("a".."z").to_a + [" ", ".", ","] # => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", ".", ","]
