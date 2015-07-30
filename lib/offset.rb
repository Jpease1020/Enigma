require_relative 'key_generator'

class OffsetCalculator
  class DateCalculator
    def initialize(date)
      @date = date
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
  end

  def self.full_rotations(date, key)
    date = DateCalculator.new(date)
    key  = KeyGenerator.new(key)
    [ date.offset_a + key.a_rotation,
      date.offset_b + key.b_rotation,
      date.offset_c + key.c_rotation,
      date.offset_d + key.d_rotation,
    ]
  end
end
