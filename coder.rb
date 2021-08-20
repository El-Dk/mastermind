# frozen_string_literal: true

# Coder class definition
class Coder
  def initialize(code)
    @code = code
    @guesses = 0
  end

  def check_color(color, index)
    return 'right' if color == @code[index]

    return 'almost' if @color.include?(color)

    nil
  end

  def check_code(code)
    @guesses += 1
    hints = []
    (0..3).each { |i| hints.push(check_color(code[i], i)) }
    hints
  end
end
