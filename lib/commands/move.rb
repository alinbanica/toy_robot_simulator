# frozen_string_literal: true

module Commands
  class Move
    def initialize(toy_robot, table)
      @toy_robot = toy_robot
      @table = table
    end

    def execute
      return unless toy_robot.placed?

      x = toy_robot.x + ToyRobot::FORWARD_MOVES[toy_robot.facing].first
      y = toy_robot.y + ToyRobot::FORWARD_MOVES[toy_robot.facing].last

      toy_robot.set_position(x, y) if table.valid_position?(x, y)
    end

    private

    attr_reader :toy_robot, :table
  end
end
