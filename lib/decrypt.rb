require_relative 'file_io'
input_file = ARGV[0]
output_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]
file = FileIO.new(input_file, output_file, key, date)
file.decrypt
