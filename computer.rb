# frozen_string_literal: false

require './coder'

class Computer
  def initialize
    @options = []
    @first_guess = true
    ('1'..'6').each do |first_color|
      ('1'..'6').each do |second_color|
        ('1'..'6').each do |thrid_color|
          ('1'..'6').each do |fourth_color|
            @options.push("#{first_color}#{second_color}#{thrid_color}#{fourth_color}")
          end
        end
      end
    end
  end
  
  def guess
    if @first_guess
      @first_guess = false
      @guess = '1122'
    else
      @guess = @options[0]
    end
    puts @guess
    @guess
  end

  def get_pins(hints)
    pins = Array.new(2, 0)
    hints.reduce(pins) do |pins, hint|
      pins[0] += 1 if hint == 'right'
      pins[1] += 1 if hint == 'almost'
      pins
    end
    pins
  end

  def remove_options(hints)
    pins = get_pins(hints)
    @options.delete_if do |option|
      code_checker = Coder.new(option)
      hints_for_option = code_checker.check_code(@guess)
      pins_for_option = get_pins(hints_for_option)
      pins_for_option[0] != pins[0] || pins_for_option[1] != pins[1]
    end
  end
end
