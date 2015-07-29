require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'message_cracker'

class FileIO

  def initialize(input_file, output_file, key = nil, date = Time.new.strftime("%d%m%y"))
    @input_file = input_file
    @output_file = output_file
    @key = key
    @date = date
  end

  def encrypt
    message_input = File.readlines(@input_file).map{|line| line.chomp}.join
    encrypted_message = Encryptor.new(message_input, @date)
    File.write(@output_file, encrypted_message.encrypt)
    puts "Created '#{@output_file}' with the key #{encrypted_message.key.key} and date #{@date}"
  end

  def decrypt
    message_input = File.readlines(@input_file).map{|line| line.chomp}.join
    decrypted_message = Decryptor.new(message_input, @date, @key)
    File.write(@output_file, decrypted_message.decrypt)
    puts "Created '#{@output_file}' with the key #{@key} and date #{@date}"
  end
end
