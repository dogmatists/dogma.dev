# This is free and unencumbered software released into the public domain.

require 'rake'

VERSION = File.read('VERSION').chomp

task default: %w(dogma.ts)

file 'dogma.ts' => %w(dogma.ts.in) + FileList['src/*.ts'] do |t|
  File.open(t.name, 'w') do |file|
    input = File.read(t.prerequisites.first)
    output = input.gsub(/\/\/\/\s*<reference\s+path="([^"]+)"\s*\/>/).with_index do |_, index|
      File.readlines($1).drop_while { |s| !s.start_with?('export') }.join
    end
    file.write(output.chomp)
  end
end
