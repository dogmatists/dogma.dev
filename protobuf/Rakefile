# This is free and unencumbered software released into the public domain.

require 'rake'

VERSION = File.read('VERSION').chomp

task default: %w(dogma.proto)

file 'dogma.proto' => %w(dogma.proto.in) + FileList['src/*.proto'] do |t|
  File.open(t.name, 'w') do |file|
    input = File.read(t.prerequisites.first)
    output = input.gsub(/import "([^"]+)";/).with_index do |_, index|
      (index.zero? ? "" : "\n") + File.readlines($1).drop_while { |s| !s.start_with?('/**') }.join.chomp
    end
    file.write(output)
  end
end
