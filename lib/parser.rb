require './lib/toy_robot'

class Parser

  def initialize(file_path:)
    @file_path = file_path
  end

  def call
    raise "Provided file dosen't exist!" unless File.exist?(file_path)

    toy_robot = ToyRobot.new

    file = File.foreach(file_path)
    file.each_entry { |line| toy_robot.execute(line.chomp) }
  end

  private

  attr_reader :file_path

end
