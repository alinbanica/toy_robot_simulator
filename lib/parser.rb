# frozen_string_literal: true

require './lib/toy_robot'
require './lib/table'
require './lib/processor'

class Parser
  def initialize(file_path:)
    @file_path = file_path
  end

  def parse
    raise 'Please provide a file to test the toy_robot_simulator!' unless file_path
    raise "Provided file doesn't exist!" unless File.exist?(file_path)

    toy_robot = ToyRobot.new
    table = Table.new(width: 5, height: 5)
    processor = Processor.new(toy_robot, table)

    file = File.foreach(file_path)
    file.each_entry { |line| processor.process(line.chomp) }
  end

  private

  attr_reader :file_path
end
