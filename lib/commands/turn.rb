# frozen_string_literal: true

module Commands
  ROTATE_INDEX_BY_DIRECTION = {
    'LEFT' => -1,
    'RIGHT' => 1
  }.freeze

  class Turn
    def initialize(toy_robot)
      @toy_robot = toy_robot
    end

    def execute
      return unless toy_robot.placed?

      facing = ToyRobot::DIRECTIONS.rotate(rotate_index)[current_facing_index]

      toy_robot.set_direction(facing)
    end

    private

    attr_reader :toy_robot

    def current_facing_index
      ToyRobot::DIRECTIONS.index(toy_robot.facing)
    end

    def rotate_index
      ROTATE_INDEX_BY_DIRECTION[direction]
    end

    def direction
      raise NoMethodError
    end
  end
end
