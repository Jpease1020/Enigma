  class KeyGenerator
  attr_reader :key

  def initialize(key = nil)
    @key = key
    if key.nil?
      random_generator
    else
      invalid_key(@key)
    end
  end

  def invalid_key_checker(input)
    input.chars.all? do |number|
      ("0".."9").include?(number)
    end
  end

  def invalid_key(input)
    key = input
    if (invalid_key_checker(input) == false) || (input.size != 5)
      raise ArgumentError.new("#{@key} is invalid, please try again moron :P" )
    else
      @key
    end
  end

  def random_generator
    array = [(0..4).map{rand(0..9)}]
    @key = array.join.rjust(5, "0").to_s
  end

  def a_rotation
    @key[0..1].to_i
  end

  def b_rotation
    @key[1..2].to_i
  end

  def c_rotation
    @key[2..3].to_i
  end

  def d_rotation
    @key[3..4].to_i
  end
end
