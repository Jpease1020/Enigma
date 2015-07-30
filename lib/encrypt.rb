require_relative 'file_io'
input_file = ARGV[0]
output_file = ARGV[1]
file = FileIO.new(input_file, output_file)
file.encrypt
