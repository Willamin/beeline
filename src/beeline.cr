STDIN.sync = true
STDOUT.sync = true
STDERR.sync = true

class Beeline
  VERSION = "0.1.0"

  BASH_STOP_COUNTING  = "\x01"
  BASH_START_COUNTING = "\x02"
  ESCAPE              = "\x1B["

  COLORS = {
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

  def separator_empty
    self << ""
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
    dont_count do
      @io << escape("1;3" + COLORS[@fore] + "m")
      @io << escape("1;4" + COLORS[@back] + "m")
    end
    @io << thing
  end

  def dont_count
    @io << BASH_STOP_COUNTING
    yield
    @io << BASH_START_COUNTING
  end

  def escape(code : String)
    ESCAPE + code
  end

  def reset
    dont_count do
      @io << escape("0m")
    end
  end
end
