# This is free and unencumbered software released into the public domain.

require 'rake'

VERSION = File.read('VERSION').chomp

task default: %w(dogma.h)

file 'dogma.h' => %w(Rakefile dogma.h.in) + FileList['dogma/*.h'] do
  File.open('dogma.h', 'w') do |file|
    input = File.read('dogma.h.in')
    output = input.gsub(/#include "([^"]+)"/).with_index do |_, index|
      (index.zero? ? "" : "\n") + File.readlines($1).drop_while { |s| !s.start_with?('/**') }.join.chomp
    end
    file.write(output)
  end
end
