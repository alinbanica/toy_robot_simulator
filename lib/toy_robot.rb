# frozen_string_literal: true

class ToyRobot
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze
  FORWARD_MOVES = {
    'NORTH' => [0, 1],
    'EAST' => [1, 0],
    'SOUTH' => [0, -1],
    'WEST' => [-1, 0]
  }.freeze

  attr_reader :x, :y, :facing

  def initialize
    @x = nil
    @y = nil
    @facing = nil
  end

  def set_position(x, y)
    @x = x
    @y = y
  end

  def set_direction(facing)
    return unless valid_direction?(facing)

    @facing = facing
  end

  def placed?
    [x, y, facing].all?
  end

  private

  def valid_direction?(facing)
    DIRECTIONS.include?(facing)
  end
end
