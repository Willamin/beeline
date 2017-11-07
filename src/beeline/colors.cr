module BLine::Colors
  COLORS = %w(black red green yellow blue magenta cyan white twofiftysix clear)
  LAYERS = %w(nolayer0 nolayer1 nolayer2 fore back)

  {% begin %}
  enum Color
    {% for color in COLORS %}
    {{color.capitalize.id}}
    {% end %}
  end
  {% end %}

  {% begin %}
  enum Layer
    {% for layer in LAYERS %}
    {{layer.capitalize.id}}
    {% end %}
  end
  {% end %}

  {% for layer in LAYERS %}
    def {{layer.id}}(color : Color)
      @{{layer.id}} = color
    end
  {% end %}

  def color_escape_code(layer : Layer, color : Color)
    escape("1;" + layer.value.to_s + color.value.to_s + "m")
  end
end

{% for color in BLine::Colors::COLORS %}
{{color.capitalize.id}} = BLine::Colors::Color::{{color.capitalize.id}}
{% end %}
