require_relative 'file_io'  # => true
input_file = ARGV[0]             # => nil
output_file = ARGV[1]
file = FileIO.new(input_file, output_file)
file.encrypt


# message_input = File.readlines(message).map{|line| line.chomp}.join  # ~> TypeError: no implicit conversion of nil into Strin
# encrypted_message = Encryptor.new(message_input, date)
# File.write(ARGV[1], encrypted_message.encrypt)
