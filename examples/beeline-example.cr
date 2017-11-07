require "../src/beeline"              # require the beeline library
Beeline.config do                     # Initialize the configuration
  fore black                          # set the foreground color to black
  back yellow                         # set the background color to yellow
  padding                             # add some padding
  dirs = ENV["PWD"].split("/")[1..-1] # get the current working directory
  if dirs.size > 1                    # if you aren't in a top level directory,
    ellipsis                          # print an ellipsis
  end                                 #
  print "/"                           # print a slash
  print dirs[-1]                      # print the directory name
  padding                             # add some padding
  temp do                             #
    fore black                        # set the foreground color to black
    back yellow                       # set the background color to yellow
    triangle_right_empty              # add an empty separator character
  end                                 #
  fore yellow                         # .set the foreground color to yellow
  back clear                          # set the background color to clear
  triangle_right                      # add a full separator character
  triangle_right_empty                # add an empty separator character
  padding                             # add some padding
end                                   #
