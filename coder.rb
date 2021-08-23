# frozen_string_literal: false

require './display'

# Coder class definition
class Coder
  include Display
  attr_reader :guesses

  def initialize(code)
    @code = code
    @guesses = 0
  end

  def reset(code)
    @guesses = 0
  end

  def check_rights(temp_code, color, index)
    if color == @code[index]
      temp_code[index] = ' '
      return 'right'
    end
    nil
  end

  def check_almosts(temp_code, color, right_index)
    if temp_code.include?(color) && !(@hints[right_index])
      temp_code.sub!(color, '*')
      return 'almost'
    end
    nil
  end

  def check_code(code_guessed)
    temp_code = @code.downcase
    @guesses += 1
    @hints = []
    (0..3).each { |i| @hints.push(check_rights(temp_code, code_guessed[i], i)) }
    (0..3).each { |i| @hints.push(check_almosts(temp_code, code_guessed[i], i)) }
    @hints
  end

  def win?
    num_rights = 0
    (0..3).each { |hint| num_rights += 1 if @hints[hint] == 'right'}
    num_rights == 4
  end
end
