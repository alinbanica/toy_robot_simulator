# frozen_string_literal: true

module Commands
  class Place
    def initialize(toy_robot, table, **kargs)
      @toy_robot = toy_robot
      @table = table
      @x = kargs[:x]
      @y = kargs[:y]
      @facing = kargs[:facing]
    end

    def execute
      return unless table.valid_position?(x, y)

      toy_robot.set_position(x, y)
      toy_robot.set_direction(facing)
    end

    private

    attr_reader :toy_robot, :table, :x, :y, :facing
  end
end
