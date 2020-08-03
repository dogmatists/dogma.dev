# This is free and unencumbered software released into the public domain.

require 'rake'

VERSION = File.read('VERSION').chomp

task default: %w(dogma.hpp)

file 'dogma.hpp' => %w(Rakefile dogma.hpp.in) + FileList['dogma/*.hpp'] do
  File.open('dogma.hpp', 'w') do |file|
    input = File.read('dogma.hpp.in')
    output = input.gsub(/#include "([^"]+)"/).with_index do |_, index|
      (index < 3 ? "" : "\n") + File.readlines($1).drop_while { |s| !s.start_with?('/**') }.join.chomp
    end
    file.write(output)
  end
end
