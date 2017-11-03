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
  ellipsis
  print "/"
  print Dir.current.split("/")[-1]
  padding
  fore :blue
  back :clear
  separator
end
