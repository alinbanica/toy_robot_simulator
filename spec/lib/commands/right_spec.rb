# frozen_string_literal: true

require 'spec_helper'
require 'commands/turn'
require 'commands/right'
require 'toy_robot'

RSpec.describe Commands::Right do
  let(:toy_robot) { ToyRobot.new }
  let(:right_command) { Commands::Right.new(toy_robot) }

  describe 'right command' do
    before { toy_robot.set_position(1, 0) }

    context 'when the toy_robot is placed on the table' do
      it 'changes the direction from NORTH to EAST' do
        toy_robot.set_direction('NORTH')

        expect { right_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and change(toy_robot, :facing).from('NORTH').to('EAST')
      end

      it 'changes the direction from EAST to SOUTH' do
        toy_robot.set_direction('EAST')

        expect { right_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and change(toy_robot, :facing).from('EAST').to('SOUTH')
      end

      it 'changes the direction from SOUTH to WEST' do
        toy_robot.set_direction('SOUTH')

        expect { right_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and change(toy_robot, :facing).from('SOUTH').to('WEST')
      end

      it 'changes the direction from WEST to NORTH' do
        toy_robot.set_direction('WEST')

        expect { right_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and change(toy_robot, :facing).from('WEST').to('NORTH')
      end
    end

    context 'when the toy_robot is not placed on the table' do
      it "doesn't change the position of the toy robot on the table" do
        expect { right_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and not_change(toy_robot, :facing)
      end
    end
  end
end
