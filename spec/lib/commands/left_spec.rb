# frozen_string_literal: true

require 'spec_helper'
require 'commands/turn'
require 'commands/left'
require 'toy_robot'

RSpec.describe Commands::Left do
  let(:toy_robot) { ToyRobot.new }
  let(:left_command) { Commands::Left.new(toy_robot) }

  describe 'LEFT command' do
    before { toy_robot.set_position(1, 0) }

    context 'when the toy_robot is placed on the table' do
      it 'changes the direction from NORTH to WEST' do
        toy_robot.set_direction('NORTH')

        expect { left_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and change(toy_robot, :facing).from('NORTH').to('WEST')
      end

      it 'changes the direction from WEST to SOUTH' do
        toy_robot.set_direction('WEST')

        expect { left_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and change(toy_robot, :facing).from('WEST').to('SOUTH')
      end

      it 'changes the direction from SOUTH to EAST' do
        toy_robot.set_direction('SOUTH')

        expect { left_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and change(toy_robot, :facing).from('SOUTH').to('EAST')
      end

      it 'changes the direction from EAST to NORTH' do
        toy_robot.set_direction('EAST')

        expect { left_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and change(toy_robot, :facing).from('EAST').to('NORTH')
      end
    end

    context 'when the toy_robot is not placed on the table' do
      it "doesn't change the position of the toy robot on the table" do
        expect { left_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and not_change(toy_robot, :facing)
      end
    end
  end
end
