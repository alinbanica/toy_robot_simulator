# frozen_string_literal: true

module Commands
  class Report
    def initialize(toy_robot)
      @toy_robot = toy_robot
    end

    def execute
      return unless toy_robot.placed?

      puts "Output: #{toy_robot.x},#{toy_robot.y},#{toy_robot.facing}"
    end

    private

    attr_reader :toy_robot
  end
end
