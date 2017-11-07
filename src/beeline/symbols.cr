module BLine::Symbols
  extend self

  def checkmark
    self << "✔"
  end

  def snowflake
    self << "✼"
  end

  def triangle_right_empty
    self << ""
  end

  def triangle_right
    self << ""
  end

  def triangle_left_empty
    self << ""
  end

  def triangle_left
    self << ""
  end

  def branch
    self << ""
  end

  def ellipsis
    self << "…"
  end

  def padding
    self << " "
  end

  def newline
    self << "\n"
  end
end
