require "./beeline/*"

class Beeline
  VERSION = "0.4.0"

  include BLine::Symbols
  include BLine::Colors

  BASH_STOP_COUNTING  = "\x01"
  BASH_START_COUNTING = "\x02"
  ESCAPE              = "\x1B["

  @io : IO
  @io = STDOUT

  @fore : Color = Color::Clear
  @back : Color = Color::Clear

  @mod : Int32
  @mod = 0

  def self.config
    STDIN.blocking = true
    b = Beeline.new
    with b yield
    b.reset
  end

  def temp
    current_fore = @fore
    current_back = @back
    current_mod = @mod
    yield
    @fore = current_fore
    @back = current_back
    @mod = current_mod
  end

  def print(thing)
    self << thing
  end

  def <<(thing : String)
    dont_count do
      @io << color_escape_code(Layer::Fore, @fore)
      @io << color_escape_code(Layer::Back, @back)
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
