require_relative 'file_io'
input_file = ARGV[0]
output_file = ARGV[1]
date = ARGV[2]
file = FileIO.new(input_file, output_file, nil, date)
file.crack
