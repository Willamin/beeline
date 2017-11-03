require "../src/beeline"

Beeline.config do
  fore :black
  back :yellow
  padding

  dirs = ENV["PWD"].split("/")[1..-1]
  if dirs.size > 1
    ellipsis
  end
  print "/"
  print dirs[-1]

  padding

  fore :black
  back :yellow
  separator_empty

  fore :yellow
  back :clear
  separator

  separator_empty
end
