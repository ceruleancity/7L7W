#!/usr/bin/env ruby 
if ARGV.length < 2
    abort("not enough params")
end

$filename = ARGV[0]
$search = ARGV[1]
puts("searching " + $filename + " for " + $search)

regex = Regexp.new($search)
File.readlines($filename).select { |line| puts line if (line[regex]) }