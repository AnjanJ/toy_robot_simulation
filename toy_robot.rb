# frozen_string_literal: true

class ToyRobot
  attr_reader :x_pos, :y_pos, :facing

  def initialize
    @x_pos = nil
    @y_pos = nil
    @facing = nil
  end

  VALID_POINTS = [0, 1, 2, 3, 4, 5].freeze
  VALID_FACE_POSITIONS = %w[north south west east].freeze

  def place(x, y, face)
    @x_pos, @y_pos, @facing = santize_input(x, y, face.downcase)
  end

  def move
    return unless can_move?

    if falling_off?
      'Robot will fall off the table, hence not moved'
    else
      case @facing
      when 'north'
        @y_pos += 1
      when 'south'
        @y_pos -= 1
      when 'west'
        @x_pos -= 1
      when 'east'
        @x_pos += 1
      end
    end
  end

  def report
    if can_move?
      "Robot is at (#{@x_pos},#{@y_pos} and facing #{@facing})"
    else
      'Please place the robot first'
    end
  end

  def santize_input(x, y, face)
    if VALID_POINTS.include?(x) && VALID_POINTS.include?(y) && VALID_FACE_POSITIONS.include?(face)
      [x, y, face]
    else
      [@x_pos, @y_pos, @facing]
    end
  end

  def can_move?
    @x_pos.nil? || @y_pos.nil? || @facing.nil? ? false : true
  end

  def falling_off?
    case @facing
    when 'north'
      @y_pos + 1 > 5
    when 'south'
      (@y_pos - 1).negative?
    when 'west'
      (@x_pos - 1).negative?
    when 'east'
      @x_pos + 1 > 5
    end
  end
end
