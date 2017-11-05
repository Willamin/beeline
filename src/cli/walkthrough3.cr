class WTThree
  def go(destination)
    "walkthrough 3/5" >> "Adding a simple beeline program to #{destination}/src/mybeeline.cr."
    file = File.open(destination + "/src/mybeeline.cr", mode = "w")
    file << <<-EXAMPLE
require "beeline"                     # require the beeline library
Beeline.config do                     # Initialize the configuration
  fore :black                         # set the foreground color to black
  back :yellow                        # set the background color to yellow
  padding                             # add some padding
  dirs = ENV["PWD"].split("/")[1..-1] # get the current working directory
  if dirs.size > 1                    # if you aren't in a top level directory,
    ellipsis                          # print an ellipsis
  end                                 #
  print "/"                           # print a slash
  print dirs[-1]                      # print the directory name
  padding                             # add some padding
  fore :black                         # set the foreground color to black
  back :yellow                        # set the background color to yellow
  separator_empty                     # add an empty separator character
  fore :yellow                        # .set the foreground color to yellow
  back :clear                         # set the background color to clear
  separator                           # add a full separator character
  separator_empty                     # add an empty separator character
  padding                             # add some padding
end                                   #
EXAMPLE
    file.close

    "walkthrough 3/5" >> "Please read it yourself after this guide."
  end
end
