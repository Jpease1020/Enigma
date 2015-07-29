class KeyGenerator
  attr_reader :key

###############   we need to output the key if its randomly generated so we can assure the encrytp and decrytp
####### have all the peritnant info the work properly

  def initialize(key = nil)
    @key = key
    if key.nil?
      random_generator
    else
      invalid_key(@key)
    end
  end

  def invalid_key(input)
    key = input
    if (input =~ /[a-z]/) || (input.size != 5)
      "#{@key} is invalid, please try again moron :P"
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
