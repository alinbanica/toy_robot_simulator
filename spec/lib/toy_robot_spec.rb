require 'spec_helper'
require 'pry'
require 'toy_robot'

RSpec.describe ToyRobot do
  let(:robot) { ToyRobot.new }

  describe 'PLACE command' do
    it 'places the robot on a valid position and facing the correct direction' do
      robot.execute('PLACE 1,2,SOUTH')

      expect { robot.execute('REPORT') }
        .to output(a_string_including('Output: 1,2,SOUTH'))
        .to_stdout
    end

    it 'allows to re-place the robot on the table multiple times ' do
      robot.execute('PLACE 1,2,SOUTH')
      robot.execute('PLACE 4,0,NORTH')
      robot.execute('PLACE 3,3,WEST')

      expect { robot.execute('REPORT') }
        .to output(a_string_including('Output: 3,3,WEST'))
        .to_stdout
    end

    it 'ignores placing the robot outside of the table' do
      robot.execute('PLACE 7,8,SOUTH')

      expect_no_output
    end

    it 'ignores placing the robot on the table when facing an unknown direction' do
      robot.execute('PLACE 1,2,NORTHY')

      expect_no_output
    end

    it 'ignores placing the robot on the table when any position is missing' do
      robot.execute('PLACE 1,NORTH')

      expect_no_output
    end
  end

  describe 'MOVE command' do
    it 'moves the robot one unit forward facing the current direction' do
      robot.execute('PLACE 2,1,NORTH')
      robot.execute('MOVE')

      expect { robot.execute('REPORT') }
        .to output(a_string_including('Output: 2,2,NORTH'))
        .to_stdout
    end

    it 'prevents robot to move outside of the table' do
      robot.execute('PLACE 0,0,WEST')
      robot.execute('MOVE')

      expect { robot.execute('REPORT') }
        .to output(a_string_including('Output: 0,0,WEST'))
        .to_stdout
    end
  end

  describe 'REPORT command' do
    it "doesn't output anything if the robot was not placed on the table yet" do
      robot.execute('LEFT')

      expect_no_output
    end
  end

  describe 'LEFT command' do
    it 'turns the robot to the left without changing teh position' do
      robot.execute('PLACE 4,1,EAST')
      robot.execute('LEFT')

      expect { robot.execute('REPORT') }
        .to output(a_string_including('Output: 4,1,NORTH'))
        .to_stdout
    end
  end

  describe 'RIGHT command' do
    it 'turns the robot to the left without changing teh position' do
      robot.execute('PLACE 4,1,EAST')
      robot.execute('RIGHT')

      expect { robot.execute('REPORT') }
        .to output(a_string_including('Output: 4,1,SOUTH'))
        .to_stdout
    end
  end

  describe 'complex sequence of commands' do
    it 'executes correctly the sequence of commands' do
      robot.execute('PLACE 1,2,EAST')
      robot.execute('MOVE')
      robot.execute('MOVE')
      robot.execute('LEFT')
      robot.execute('MOVE')
      robot.execute('REPORT')

      expect { robot.execute('REPORT') }
        .to output(a_string_including('Output: 3,3,NORTH'))
        .to_stdout
    end

    it 'ingnores all commands before PLACE' do
      robot.execute('MOVE')
      robot.execute('REPORT')
      robot.execute('MOVE')
      robot.execute('LEFT')
      robot.execute('PLACE 1,2,EAST')
      robot.execute('MOVE')
      robot.execute('MOVE')
      robot.execute('RIGHT')
      robot.execute('MOVE')
      robot.execute('REPORT')

      expect { robot.execute('REPORT') }
        .to output(a_string_including('Output: 3,1,SOUTH'))
        .to_stdout
    end

  end

  def expect_no_output
    expect { robot.execute('REPORT') }
      .to_not output
      .to_stdout
  end
end