require_relative 'key_generator'

class Offset

  attr_reader :date, :key
  def initialize(date, key)
    @date = date
    @key = KeyGenerator.new(key)
  end

  def squared
    date_to_i = @date.to_i
    date_to_i ** 2
  end

  def last_four
    squared.to_s[-4..-1]
  end

  def offset_a
    last_four[0].to_i
  end

  def offset_b
    last_four[1].to_i
  end

  def offset_c
    last_four[2].to_i
  end

  def offset_d
    last_four[3].to_i
  end

  def full_rotation_a
    offset_a + key.a_rotation
  end

  def full_rotation_b
    offset_b + key.b_rotation
  end

  def full_rotation_c
    offset_c + key.c_rotation
  end

  def full_rotation_d
    offset_d + key.d_rotation
  end

end





# The Offsets
#
# The date of message transmission is also factored into the encryption
# Consider the date in the format DDMMYY, like 020315
# Square the numeric form (412699225) and find the last four digits (9225)
# The first digit is the "A offset" (9)
# The second digit is the "B offset" (2)
# The third digit is the "C offset" (2)
# The fourth digit is the "D offset" (5)
