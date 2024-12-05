# frozen_string_literal: true

module Commands
  ROTATE_INDEX_BY_DIRECTION = {
    left: -1,
    right: 1
  }.freeze

  class Turn
    def initialize(toy_robot, direction)
      @toy_robot = toy_robot
      @direction = direction
    end

    def execute
      return unless toy_robot.placed?

      facing = ToyRobot::DIRECTIONS.rotate(rotate_index)[current_facing_index]

      toy_robot.set_direction(facing)
    end

    private

    attr_reader :toy_robot, :direction

    def current_facing_index
      ToyRobot::DIRECTIONS.index(toy_robot.facing)
    end

    def rotate_index
      ROTATE_INDEX_BY_DIRECTION[direction]
    end

  end
end
