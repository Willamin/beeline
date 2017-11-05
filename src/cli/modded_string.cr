class String
  def >>(thing, newline = true)
    Beeline.config do
      fore :black
      back :yellow
      padding
      print self

      fore :black
      back :yellow
      separator_empty

      fore :yellow
      back :clear
      separator

      separator_empty
      padding
    end
    print thing
    print "\n" if newline
  end

  def gets
    self.>>("", false)
    input = STDIN.gets
    if input.nil?
      "error          " >> "A problem occured."
      exit 2
    end
    input
  end
end
