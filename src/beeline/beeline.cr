module Beeline
  class Beeline
    BASH_STOP_COUNTING  = "\\["
    BASH_START_COUNTING = "\\]"
    ESCAPE              = "\\e["
    COLORS              = {
      black:       "0",
      red:         "1",
      green:       "2",
      yellow:      "3",
      blue:        "4",
      magenta:     "5",
      cyan:        "6",
      white:       "7",
      twofiftysix: "8",
      clear:       "9",
    }

    @io : IO
    @io = STDOUT

    @fore : Symbol
    @fore = :clear
    @back : Symbol
    @back = :clear

    def self.config
      b = Beeline.new
      with b yield
      b.reset
    end

    def fore(color)
      @fore = color
    end

    def back(color)
      @back = color
    end

    def padding
      self << " "
    end

    def separator
      self << ""
    end

    def ellipsis
      self << "…"
    end

    def newline
      self << "\n"
    end

    def print(thing)
      self << thing
    end

    def <<(thing : String)
      @io << escape("1;3" + COLORS[@fore] + "m")
      @io << escape("1;4" + COLORS[@back] + "m")
      @io << thing
    end

    def escape(code : String)
      BASH_STOP_COUNTING + ESCAPE + code + BASH_START_COUNTING
    end

    def reset
      @io << escape("0m")
    end
  end
end
