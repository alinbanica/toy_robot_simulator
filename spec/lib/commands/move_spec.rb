# frozen_string_literal: true

require 'spec_helper'
require 'commands/move'
require 'toy_robot'
require 'table'

RSpec.describe Commands::Move do
  let(:toy_robot) { ToyRobot.new }
  let(:table) { Table.new(width: 5, height: 5) }
  let(:move_command) { Commands::Move.new(toy_robot, table) }

  describe 'MOVE command' do
    context 'when the toy_robot is placed on the table' do
      it 'moves on step to the WEST' do
        toy_robot.set_position(2, 2)
        toy_robot.set_direction('WEST')

        expect { move_command.execute }
          .to change(toy_robot, :x).from(2).to(1)
          .and not_change(toy_robot, :y)
          .and not_change(toy_robot, :facing)
      end

      it 'moves on step to the SOUTH' do
        toy_robot.set_position(2, 2)
        toy_robot.set_direction('SOUTH')

        expect { move_command.execute }
          .to not_change(toy_robot, :x)
          .and change(toy_robot, :y).from(2).to(1)
          .and not_change(toy_robot, :facing)
      end

      it 'moves on step to the EAST' do
        toy_robot.set_position(2, 2)
        toy_robot.set_direction('EAST')

        expect { move_command.execute }
          .to change(toy_robot, :x).from(2).to(3)
          .and not_change(toy_robot, :y)
          .and not_change(toy_robot, :facing)
      end

      it 'moves on step to the NORTH' do
        toy_robot.set_position(2, 2)
        toy_robot.set_direction('NORTH')

        expect { move_command.execute }
          .to not_change(toy_robot, :x)
          .and change(toy_robot, :y).from(2).to(3)
          .and not_change(toy_robot, :facing)
      end

      it 'ignores the moves outside the table' do
        toy_robot.set_position(0, 2)
        toy_robot.set_direction('WEST')

        expect { move_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and not_change(toy_robot, :facing)
      end
    end

    context 'when the toy_robot is not placed on the table' do
      it "doesn't change the position of the toy robot on the table" do
        expect { move_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and not_change(toy_robot, :facing)
      end
    end
  end
end
