# frozen_string_literal: true

require 'require_all'
require_all './lib/commands'

class Processor
  def initialize(toy_robot, table)
    @toy_robot = toy_robot
    @table = table
  end

  def process(command_str)
    if command_str.match(/\APLACE (\d+),(\d+),(#{ToyRobot::DIRECTIONS.join('|')})\z/)
      kargs = {
        x: ::Regexp.last_match(1).to_i,
        y: ::Regexp.last_match(2).to_i,
        facing: ::Regexp.last_match(3)
      }

      command = Commands::Place.new(toy_robot, table, **kargs)
    else
      command = get_command(command_str)
    end

    command&.execute
  end

  private

  attr_reader :toy_robot, :table

  def get_command(command_str)
    case command_str
    when 'MOVE'
      Commands::Move.new(toy_robot, table)
    when 'LEFT'
      Commands::Left.new(toy_robot)
    when 'RIGHT'
      Commands::Right.new(toy_robot)
    when 'REPORT'
      Commands::Report.new(toy_robot)
    end
  end
end
