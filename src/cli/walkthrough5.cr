class WTFive
  def go(destination)
    "walkthrough 5/5" >> "This guide does not support setting your PS1."
    "walkthrough 5/5" >> "However, it can tell you what to do."
    "walkthrough 5/5" >> "Search online for instructions to set your shell prompt (PS1) for your system."
    "walkthrough 5/5" >> "Typically, you can add the following line to your ~/.bashrc or ~/.bash_profile:"
    puts "PS1=\"\\$(#{destination}/bin/beeline)\""
  end
end
