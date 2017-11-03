require "./beeline/*"

STDIN.sync = true
STDOUT.sync = true
STDERR.sync = true

module Beeline
end

Beeline::Beeline.config do
  fore :black
  back :blue
  padding

  dirs = ENV["PWD"].split("/")[1..-1]
  if dirs.size > 1
    ellipsis
  end
  print "/"
  print dirs[-1]

  padding
  fore :blue
  back :clear
  separator
  padding
end
